require 'rails_helper'

describe ImagesController do
  describe "GET index" do
    context "with unauthenticated person" do
      it "redirects to the sign in page" do
        get :index

        expect(response).to redirect_to sign_in_path
      end
    end

    context "with authenticated person" do
      before(:each) do
        @current_person = Fabricate(:person)
        set_current_person(@current_person)
      end
      after(:each) { clear_current_signed_in_person }

      it "renders the index template" do
        get :index

        expect(response).to render_template :index
      end

      it "assigns @images" do
        allow(Image).to receive(:all) { [1] }

        get :index

        expect(assigns(:images)).to eq([1])
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
    context "with authenticated person" do
      before { set_current_person }
      after { clear_current_signed_in_person }

      it "creates a new image" do
        expect {
          xhr :post, :create, image: {}
        }.to change(Image, :count).by(1)
      end
    end
  end

  describe "GET show" do
    context "with authenticated person" do
      before(:each) do
        @current_person = Fabricate(:person)
        @an_image = Fabricate(:image)
        set_current_person(@current_person)
      end

      after(:each) { clear_current_signed_in_person }

      it "renders the show template" do
        get :show, id: @an_image.id

        expect(response).to render_template :show
      end

      it "sets @image" do
        get :show, id: @an_image.id

        expect(assigns(:image)).to be_a Image
      end
    end
  end
end
