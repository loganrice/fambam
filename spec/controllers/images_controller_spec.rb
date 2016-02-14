require 'rails_helper'

describe ImagesController do
  describe "GET index" do
    context "with unauthenticated person" do
      it "redirects to the sign in page" do
        get :index

        expect(response).to redirect_to sign_in_path
      end
    end
  end

  describe "GET new" do
    context "with unathenticated person" do
      it "redirects to sign in path" do
        get :new

        expect(response).to redirect_to sign_in_path
      end
    end

    context "with authenticated person" do
      before { set_current_person }
      after { clear_current_signed_in_person }

      it "renders the new template" do
        get :new

        expect(response).to render_template :new
      end

      it "sets @image" do
        get :new

        expect(assigns(:image)).to be_a_new Image 
      end
    end
  end

  describe "POST create" do
    before do 
      set_current_person 
    end

    after { clear_current_signed_in_person }
    
    it "renders json" do
      xhr :post, :create, image: {file: fixture_file_upload('family_photo.png', 'image/png') }

      expect(JSON.parse(response.body)).to eq(Image.last.as_json)
    end

    it "creates a new image" do
      expect {
        xhr :post, :create, image: {file: fixture_file_upload('family_photo.png', 'image/png') }
      }.to change(Image, :count).by(1)
    end
  end
end
