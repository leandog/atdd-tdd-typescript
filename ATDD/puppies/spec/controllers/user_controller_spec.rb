require 'rails_helper'


RSpec.describe UsersController, type: :controller do
  before(:each) do
    UsersController.skip_before_action :authorize, raise: false
  end

  def mock_user(stubs={})
    @user ||= mock_model(User, stubs).as_null_object
  end

  def mock_adoption(stubs={})
    @mock_adoption ||= mock_model(Adoption, stubs).as_null_object
  end

  def mock_cart(stubs={})
    @cart ||= mock_model(Cart, stubs).as_null_object
  end

  let(:valid_attributes) {
    {name: "Joe Sixpack", password:"12345", password_confirmation:"12345"}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all users as @user" do
      allow(User).to receive(:order).with(:name).and_return(mock_user)
      get :index
      expect(assigns(:users)).to eq(mock_user)
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      allow(User).to receive(:find).with("37").and_return(mock_user)
      get :show, params: { id: "37" }
      expect(assigns(:user)).to be(mock_user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      CartsController.skip_before_action :authorize, raise: false
      allow(Cart).to receive(:find).and_return(mock_cart(adoptions: [mock_adoption]))
      allow(User).to receive(:new).and_return(mock_user)
      get :new
      expect(assigns(:user)).to be(mock_user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      allow(User).to receive(:find).with("37").and_return(mock_user)
      get :edit, params: { id: "37" }
      expect(assigns(:user)).to be(mock_user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created user as @user" do
        allow(User).to receive(:new).and_return(mock_user(save: true))
        post :create, params: { user: valid_attributes }
        expect(assigns(:user)).to be(mock_user)
      end

      it "redirects to the users page" do
        allow(User).to receive(:new).and_return(mock_user(save: true))
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(users_path)
      end

      it "should display a 'successfully created' message" do
        allow(User).to receive(:new).and_return(mock_user(save: true, name: 'Kim'))
        post :create, params: { user: {name: "Kim"} }
        expect(flash[:notice]).to eq('User Kim was successfully created.')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        allow(User).to receive(:new).and_return(mock_user(save: false))
        post :create, params: { user: invalid_attributes }
        expect(assigns(:user)).to be(mock_user)
      end

      it "re-renders the 'new' template" do
        allow(User).to receive(:new).and_return(mock_user(save: false))
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        allow(User).to receive(:find).with("37").and_return(mock_user)
        allow(mock_user).to receive(:update)
        put :update, params: { id: "37", user: valid_attributes }
        expect(response.status).to be(200)
      end

      it "assigns the requested user as @user" do
        allow(User).to receive(:find).with("37").and_return(mock_user(update: true))
        put :update, params: { id: "37", user: {name: "Kim"} }
        expect(assigns(:user)).to be(mock_user)
      end

      it "redirects to the user" do
        allow(User).to receive(:find).and_return(mock_user(update: true))
        put :update, params: { id: "1", user: {name: "Kim"} }
        expect(response).to redirect_to(users_path)
      end

      it "should display a 'successfully updated' message" do
        allow(User).to receive(:find).and_return(mock_user(update: true))
        allow(mock_user).to receive(:name).and_return('Kim')
        put :update, params: { id: "1", user: {name: "Kim"} }
        expect(flash[:notice]).to eq('User Kim was successfully updated.')
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        allow(User).to receive(:find).and_return(mock_user(update: false))
        put :update, params: { id: "1", user: invalid_attributes }
        expect(assigns(:user)).to be(mock_user)
      end

      it "re-renders the 'edit' template" do
        allow(User).to receive(:find).and_return(mock_user(update: false))
        put :update, params: { id: "1", user: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      allow(User).to receive(:find).with("37").and_return(mock_user)
      allow(mock_user).to receive(:destroy)
      delete :destroy, params: { id: "37" }
    end

    it "redirects to the users page" do
      allow(User).to receive(:find).and_return(mock_user)
      delete :destroy, params: { id: "1" }
      expect(response).to redirect_to(users_url)
    end
  end

end
