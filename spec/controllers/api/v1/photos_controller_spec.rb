require 'spec_helper'

describe Api::V1::PhotosController, :type => :controller do
  describe "GET #search" do
    before do
      Store.current.clear
    end

    it "respond success for cached request" do
      # warm cache 
      get :search, query: "test"

      # tested request
      get :search, query: "test"
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "respond success for not cached request" do
      # from cache
      get :search, query: "test test"
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end
end
