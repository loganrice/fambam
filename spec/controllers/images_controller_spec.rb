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
end
