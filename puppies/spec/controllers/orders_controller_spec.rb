require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:each) do
    OrdersController.skip_before_action :authorize, raise: false
  end

  def mock_puppy(stubs={})
    @puppy ||= mock_model(Puppy, stubs).as_null_object
  end

  def mock_order(stubs={})
    @order ||= mock_model(Order, stubs).as_null_object
  end

  def mock_cart(stubs={})
    @cart ||= mock_model(Cart, stubs).as_null_object
  end

  def mock_adoption(stubs={})
    @mock_adoption ||= mock_model(Adoption, stubs).as_null_object
  end

  let(:valid_attributes) {
    {name: "Joe Sixpack", address: "123 Main St.", email: "joe@sixpack.com", pay_type: "Check"}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all orders as @orders" do
      allow(Order).to receive(:paginate).and_return(mock_order)
      get :index
      expect(assigns(:orders)).to be(mock_order)
    end
  end

  describe "GET show" do
    it "assigns the requested order as @order" do
      allow(Order).to receive(:find).with("37").and_return(mock_order)
      get :show, params: { id: "37" }
      expect(assigns(:order)).to be(mock_order)
    end
  end

  describe "GET new" do
    it "assigns a new order as @order" do
      allow(Cart).to receive(:find).and_return(mock_cart(adoptions: [mock_adoption]))
      allow(Order).to receive(:new).and_return(mock_order)
      get :new
      expect(assigns(:order)).to be(mock_order)
    end

    it "redirects to agency page when not adoptions present" do
      allow(Cart).to receive(:find).and_return(mock_cart(adoptions: []))
      get :new
      expect(response).to redirect_to(agency_url)
    end
  end

  describe "GET edit" do
    it "assigns the requested order as @order" do
      allow(Order).to receive(:find).with("37").and_return(mock_order)
      get :edit, params: { id: "37" }
      expect(assigns(:order)).to be(mock_order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created puppy as @puppy" do
        allow(Order).to receive(:new).and_return(mock_order(save: true))
        post :create, params: { order: valid_attributes }
        expect(assigns(:order)).to be(mock_order)
      end

      it "redirects to the agency page" do
        allow(Order).to receive(:new).and_return(mock_order(save: true))
        post :create, params: { order: valid_attributes }
        expect(response).to redirect_to(agency_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        allow(Order).to receive(:new).and_return(mock_order(save: false))
        post :create, params: { order: invalid_attributes }
        expect(assigns(:order)).to be(mock_order)
      end

      it "re-renders the 'new' template" do
        allow(Order).to receive(:new).and_return(mock_order(save: false))
        post :create, params: { order: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested order" do
        allow(Order).to receive(:find).with("37").and_return(mock_order)
        allow(mock_order).to receive(:update)
        put :update, params: { id: "37", order: valid_attributes }
        expect(response.status).to be(200)
      end

      it "assigns the requested order as @order" do
        allow(Order).to receive(:find).and_return(mock_order(update: true))
        put :update, params: { id: "1", order: valid_attributes }
        expect(assigns(:order)).to be(mock_order)
      end

      it "redirects to the order" do
        allow(Order).to receive(:find).and_return(mock_order(update: true))
        put :update, params: { id: "1", order: valid_attributes }
        expect(response).to redirect_to(order_url(mock_order))
      end
    end

    describe "with invalid params" do
      it "assigns the order as @order" do
        allow(Order).to receive(:find).and_return(mock_order(update: false))
        put :update, params: { id: "1", order: valid_attributes }
        expect(assigns(:order)).to be(mock_order)
      end

      it "re-renders the 'edit' template" do
        allow(Order).to receive(:find).and_return(mock_order(update: false))
        put :update, params: { id: "1", order: valid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested order" do
      allow(Order).to receive(:find).with("37").and_return(mock_order)
      allow(mock_order).to receive(:destroy)
      delete :destroy, params: { id: "37" }
    end

    it "redirects to the orders page" do
      allow(Order).to receive(:find).and_return(mock_order)
      delete :destroy, params: { id: "1" }
      expect(response).to redirect_to(orders_url)
    end
  end

end
