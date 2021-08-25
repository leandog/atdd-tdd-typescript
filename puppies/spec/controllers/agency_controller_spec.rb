require 'rails_helper'


RSpec.describe AgencyController, type: :controller do

  def mock_puppy(stubs={})
    @mock_puppy ||= mock_model(Puppy, stubs).as_null_object
  end

  context "handling GET /index" do
    before(:each) do
      allow(Puppy).to receive(:order).and_return(mock_puppy)
    end

    def do_get
      get :index
    end

    it "should be successful" do
      do_get
      expect(response.status).to eq(200)
    end

    it "should render the index template" do
      do_get
      expect(response).to render_template('index')
    end

    it "should assign the products for the view" do
      do_get
      expect(assigns[:puppies]).to eq(mock_puppy)
    end
  end
end
