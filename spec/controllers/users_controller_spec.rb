require 'spec_helper'

describe UsersController do
  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "With valid inputs" do
      before { post :create, user: Fabricate.attributes_for(:user) }
      
      it "creates the user" do
        expect(User.count).to eq(1)
      end
      it "redirects to the sign in page" do
        expect(response).to redirect_to sign_in_path
      end
    end
      
    context "With invalid inputs" do
      before do
        post :create, user: { password: "password", full_name: "John Curry" }
      end
      
      it "does not create the user" do
        expect(User.count).to eq(0)
      end
      it "renders the new template" do
        expect(response).to render_template :new
      end
      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
end
