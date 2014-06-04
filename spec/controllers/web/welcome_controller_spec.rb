require 'spec_helper'

describe Web::WelcomeController, :type => :controller do
  render_views

  describe "GET #index" do
    it "responds success" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
