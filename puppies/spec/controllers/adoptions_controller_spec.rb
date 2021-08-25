require 'rails_helper'


RSpec.describe AdoptionsController, type: :controller do
  render_views

  before(:each) do
    PuppiesController.skip_before_action :authorize, raise: false
  end

  def mock_adoption(stubs={})
    @mock_adoption ||= mock_model(Adoption, stubs).as_null_object
  end

  def mock_puppy(stubs={})
    @mock_puppy ||= mock_model(Puppy, stubs).as_null_object
  end

  def mock_cart(stubs={})
    @cart ||= mock_model(Cart, stubs).as_null_object
  end

  let(:valid_attributes) {
    {puppy_id:"1", cart_id:"1"}
  }

  let(:invalid_attributes) {
    {:puppy_id => nil}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all adoptions as @adoptions" do
      allow(Adoption).to receive(:all).and_return(mock_adoption)
      get :index
      expect(assigns(:adoptions)).to be(mock_adoption)
    end
  end

  describe "GET show" do
    it "assigns the requested adoption as @adoptions" do
      allow(Adoption).to receive(:find).and_return(mock_adoption)
      get :show, params: { id: "37" }
      expect(assigns(:adoption)).to be(mock_adoption)
    end
  end

  describe "GET new" do
    it "assigns a new adoption as @adoption" do
      allow(Adoption).to receive(:new).and_return(mock_adoption)
      get :new
      expect(assigns(:adoption)).to be(mock_adoption)
    end
  end

  describe "GET edit" do
    it "assigns the requested adoption as @adoption" do
      allow(Adoption).to receive(:find).with("37").and_return(mock_adoption)
      get :edit, params: { id: "37" }
      expect(assigns(:adoption)).to be(mock_adoption)
    end
  end

  describe "POST create" do
    before(:each) do
      allow(Puppy).to receive(:find).and_return(mock_puppy)
    end

    describe "with valid params" do
      it "assigns a newly created adoption as @adoption" do
        allow(Cart).to receive(:find).and_return(mock_cart(add_puppy: mock_adoption(save: true)))
        post :create, params: { adoption: {'these' => 'params'} }
        expect(assigns(:adoption)).to be(mock_adoption)
      end

      it "redirects to the cart with the new adoption" do
        allow(Cart).to receive(:find).and_return(mock_cart(add_puppy: mock_adoption(save: true)))
        post :create, params: { adoption: {} }
        expect(response).to redirect_to(cart_path(mock_adoption))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved adoption as @adoption" do
        allow(Cart).to receive(:find).and_return(mock_cart(add_puppy: mock_adoption(save: false)))
        post :create, params: { adoption: {'these' => 'params'} }
        expect(assigns(:adoption)).to be(mock_adoption)
      end

      it "re-renders the 'new' template" do
        allow(Cart).to receive(:find).and_return(mock_cart(add_puppy: mock_adoption(save: false)))
        post :create, params: { adoption: {} }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested adoption" do
        allow(Adoption).to receive(:find).with("37").and_return(mock_adoption)
        allow(mock_adoption).to receive(:update)
        put :update, params: { id: "37", adoption: valid_attributes }
      end

      it "assigns the requested adoption as @adoption" do
        allow(Adoption).to receive(:find).and_return(mock_adoption(update: true))
        put :update, params: { id: "1", adoption: valid_attributes }
        expect(assigns(:adoption)).to be(mock_adoption)
      end

      it "redirects to the adoption" do
        allow(Adoption).to receive(:find).and_return(mock_adoption(update: true))
        put :update, params: { id: "1", adoption: valid_attributes }
        expect(response).to redirect_to(adoption_url(mock_adoption))
      end
    end

    describe "with invalid params" do
      it "assigns the adoption as @adoption" do
        allow(Adoption).to receive(:find).and_return(mock_adoption(update: false))
        put :update, params: { id: "1", adoption: invalid_attributes }
        expect(assigns(:adoption)).to be(mock_adoption)
      end

      it "re-renders the 'edit' template" do
        allow(Adoption).to receive(:find).and_return(mock_adoption(update: false))
        put :update, params: { id: "1", adoption: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested adoption" do
      allow(Adoption).to receive(:find).with("37").and_return(mock_adoption)
      allow(mock_adoption).to receive(:destroy)
      delete :destroy, params: { id: "37" }
    end

    it "redirects to the adoptions list" do
      allow(Adoption).to receive(:find).and_return(mock_adoption)
      delete :destroy, params: { id: "1" }
      expect(response).to redirect_to(adoptions_url)
    end
  end

end
