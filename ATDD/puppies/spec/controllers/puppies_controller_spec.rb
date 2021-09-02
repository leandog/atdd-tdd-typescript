require 'rails_helper'


RSpec.describe PuppiesController, type: :controller do
  render_views

  before(:each) do
    PuppiesController.skip_before_action :authorize, raise: false
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
    {:name => "Dutchess", breed:"Golden Retriever", image_url:"/derp/diddly.jpg", fees:"1.0"}
  }

  let(:invalid_attributes) {
    {:name => ""}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all puppys as @puppies" do
      allow(Puppy).to receive(:all).and_return(mock_puppy)
      get :index, params: {}, session: valid_session
      expect(assigns(:puppies)).to eq(mock_puppy)
    end
  end

  describe "GET show" do
    it "assigns the requested puppy as @puppy" do
      allow(Puppy).to receive(:find).with("37").and_return(mock_puppy)
      get :show, params: { id: 37 }, session: valid_session
      expect(assigns(:puppy)).to eq(mock_puppy)
    end
  end

  describe "GET new" do
    it "assigns a new puppy as @puppy" do
      CartsController.skip_before_action :authorize, raise: false
      allow(Cart).to receive(:find).and_return(mock_cart(:adoptions => [mock_adoption]))
      allow(Puppy).to receive(:new).and_return(mock_puppy)
      get :new, params: {}, session: valid_session
      expect(assigns(:puppy)).to eq(mock_puppy)
    end
  end

  describe "GET edit" do
    it "assigns the requested puppy as @puppy" do
      allow(Puppy).to receive(:find).with("37").and_return(mock_puppy)
      get :edit, params: { id: 37 }, session: valid_session
      expect(assigns(:puppy)).to eq(mock_puppy)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created puppy as @puppy" do
        allow(Puppy).to receive(:new).and_return(mock_puppy(save: true))
        post :create, params: { puppy: valid_attributes }, session: valid_session
        expect(assigns(:puppy)).to eq(mock_puppy)
      end

      it "redirects to the puppy page" do
        allow(Puppy).to receive(:new).and_return(mock_puppy(:save => true))
        post :create, params: { puppy: valid_attributes }, session: valid_session
        expect(response).to redirect_to(puppy_url(mock_puppy))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved puppy as @puppy" do
        allow(Puppy).to receive(:new).and_return(mock_puppy(save: false))
        post :create, params: { puppy: invalid_attributes }, session: valid_session
        expect(assigns(:puppy)).to eq(mock_puppy)
      end

      it "re-renders the 'new' template" do
        allow(Puppy).to receive(:new).and_return(mock_puppy(save: false))
        post :create, params: { puppy: invalid_attributes }, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do

      it "updates the requested puppy" do
        allow(Puppy).to receive(:find).with("37").and_return(mock_puppy)
        allow(mock_puppy).to receive(:update).and_return(true)
        allow(mock_puppy).to receive(:name).and_return(valid_attributes)
        put :update, params: { id: "37", puppy: valid_attributes }, session: valid_session
        expect(response.status).to be(302)
      end

      it "assigns the requested puppy as @puppy" do
        allow(Puppy).to receive(:find).and_return(mock_puppy(update: true))
        put :update, params: { id: "1", puppy: valid_attributes }, session: valid_session
        expect(assigns(:puppy)).to eq(mock_puppy)
      end

      it "redirects to the puppy" do
        allow(Puppy).to receive(:find).and_return(mock_puppy(update: true))
        put :update, params: { id: "1", puppy: valid_attributes }, session: valid_session
        expect(response).to redirect_to(puppy_url(mock_puppy))
      end
    end

    describe "with invalid params" do
      it "assigns the puppy as @puppy" do
        allow(Puppy).to receive(:find).and_return(mock_puppy(update: false))
        put :update, params: { id: "1", puppy: invalid_attributes }, session: valid_session
        expect(assigns(:puppy)).to be(mock_puppy)
      end

      it "re-renders the 'edit' template" do
        allow(Puppy).to receive(:find).and_return(mock_puppy(update: false))
        put :update, params: { id: "1", puppy: invalid_attributes }, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested puppy" do
      allow(Puppy).to receive(:find).with("37").and_return(mock_puppy)
      allow(mock_puppy).to receive(:destroy)
      delete :destroy, params: { id: 37 }, session: valid_session
    end

    it "redirects to the puppies page" do
      allow(Puppy).to receive(:find).and_return(mock_puppy)
      delete :destroy, params: { id: 1 }, session: valid_session
      expect(response).to redirect_to(puppies_url)
    end
  end

end
