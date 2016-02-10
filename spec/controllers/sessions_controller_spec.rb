require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template" do
      get :new

      expect(response).to render_template :new
    end

    it "sets @person" do
      get :new

      expect(assigns(:person)).to be_a Person
    end
  end

  describe "POST create" do
    context "with authenticated person" do
      it "sets the session[:person_id]" do
        a_person = Fabricate(:person)

        post :create, email: a_person.email, password: a_person.password

        expect(session[:person_id]).to eq(a_person.id)
      end

      it "redirects to root path" do
        a_person = Fabricate(:person)
        
        post :create, email: a_person.email, password: a_person.password

        expect(response).to redirect_to root_path
      end

      it "sets flash notice" do
        a_person = Fabricate(:person)
        
        post :create, email: a_person.email, password: a_person.password
        
        expect(flash[:notice]).to be_present
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      set_current_person 
      @person_id = session[:person_id]
    end
  
    it "should delete the session" do
      delete :destroy, id: @person_id

      expect(session[:person_id]).to be_nil 
    end

    it "should redirect to the root path" do
      delete :destroy, id: @person_id

      expect(response).to redirect_to root_path
    end

    it "should set the signout notice" do
      delete :destroy, id: @person_id

      expect(flash[:notice]).to be_present
    end
  end
end
