require 'rails_helper'

describe RelationshipsController do
  describe "GET index" do
    context "with authenticated person" do
      before { set_current_person }
      after { clear_current_signed_in_person }

      it "renders index template" do
        get :index
        
        expect(response).to render_template :index
      end

      it "sets @relationships" do
        relationship = Fabricate(:relationship)
        set_current_person(relationship.follower)
        
        get :index

        expect(assigns(:relationships)).to eq([relationship])
      end
    end
  end

  describe "POST create" do
    before { @current_signed_in_person_id = set_current_person }
    after { clear_current_signed_in_person }
    
    context "with authenticated person and allowable params" do
      it "creates a new relationship" do
        a_person = Fabricate(:person)
        simulate_coming_from_images_path

        expect{
          post :create, leader_id: a_person.id
        }.to change(Relationship, :count).by(1)
      end
    end
  end

  describe "DELETE destroy" do
    before { @current_signed_in_person_id = set_current_person }
    after { clear_current_signed_in_person }
    
    it "deletes a relationship" do
      leader = Fabricate(:person)
      relationship = Fabricate(:relationship, leader: leader, follower_id: @current_signed_in_person_id)
      simulate_coming_from_images_path

      expect{
        delete :destroy, id: relationship
      }.to change(Relationship, :count).by(-1)
    end

    it "does not delete a relationship that it is not associated with" do
      relationship = Fabricate(:relationship)
      simulate_coming_from_images_path
      
      expect{
        delete :destroy, id: relationship
      }.to change(Relationship, :count).by(0)
    end
  end
end
