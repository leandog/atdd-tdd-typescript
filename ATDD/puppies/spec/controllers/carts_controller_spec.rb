require 'rails_helper'


RSpec.describe CartsController, type: :controller do

  def mock_cart(stubs={})
    @cart ||= mock_model(Cart, stubs).as_null_object
  end

  let(:valid_attributes) {
    {puppy_id: "1", cart_id: "1"}
  }

  let(:invalid_attributes) {
    {puppy_id: nil}
  }

  let(:valid_session) { {} }

  before(:each) do
    CartsController.skip_before_action :authorize, raise: false
  end

  describe "GET index" do
    it "assigns all carts as @carts" do
      allow(Cart).to receive(:all).and_return(mock_cart)
      get :index
      expect(assigns(:carts)).to eq(mock_cart)
    end
  end

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      allow(Cart).to receive(:find).with("37").and_return(mock_cart)
      get :show, params: { id: "37" }
      expect(assigns(:cart)).to be(mock_cart)
    end
  end

  describe "GET new" do
    it "assigns a new cart as @cart" do
      allow(Cart).to receive(:new).and_return(mock_cart)
      get :new
      expect(assigns(:cart)).to be(mock_cart)
    end
  end

  describe "GET edit" do
    it "assigns the requested cart as @cart" do
      allow(Cart).to receive(:find).with("37").and_return(mock_cart)
      get :edit, params: { id: "37" }
      expect(assigns(:cart)).to be(mock_cart)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created cart as @cart" do
        allow(Cart).to receive(:new).and_return(mock_cart(save: true))
        post :create, params: { cart: valid_attributes }
        expect(assigns(:cart)).to be(mock_cart)
      end

      it "redirects to the created cart" do
        allow(Cart).to receive(:new).and_return(mock_cart(save: true))
        post :create, params: { cart: valid_attributes }
        expect(response).to redirect_to(cart_path(mock_cart))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cart as @cart" do
        allow(Cart).to receive(:new).and_return(mock_cart(save: false))
        post :create, params: { cart: invalid_attributes }
        expect(assigns(:cart)).to be(mock_cart)
      end

      it "re-renders the 'new' template" do
        allow(Cart).to receive(:new).and_return(mock_cart(save: false))
        post :create, params: { cart: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cart" do
        allow(Cart).to receive(:find).with("37").and_return(mock_cart)
        allow(mock_cart).to receive(:update)
        put :update, params: { id: "37", cart: valid_attributes }
      end

      it "assigns the requested cart as @cart" do
        allow(Cart).to receive(:find).and_return(mock_cart(update: true))
        put :update, params: { id: "1", cart: valid_attributes }
        expect(assigns(:cart)).to be(mock_cart)
      end

      it "redirects to the cart" do
        allow(Cart).to receive(:find).and_return(mock_cart(update: true))
        put :update, params: { id: "1", cart: valid_attributes }
        expect(response).to redirect_to(cart_path(mock_cart))
      end
    end

    describe "with invalid params" do
      it "assigns the cart as @cart" do
        allow(Cart).to receive(:find).and_return(mock_cart(update: false))
        put :update, params: { id: "1", cart: invalid_attributes }
        expect(assigns(:cart)).to be(mock_cart)
      end

      it "re-renders the 'edit' template" do
        allow(Cart).to receive(:find).and_return(mock_cart(update: false))
        put :update, params: { id: "1", cart: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cart" do
      allow(Cart).to receive(:find).with("37").and_return(mock_cart)
      allow(mock_cart).to receive(:destroy)
      delete :destroy, params: { id: "37" }
    end

    it "redirects to the agency page" do
      allow(Cart).to receive(:find).and_return(mock_cart)
      delete :destroy, params: { id: "1" }
      expect(response).to redirect_to(agency_url)
    end
  end

end
