require "rails_helper"

RSpec.describe "api/v1/store", type: :request do
  context "Only accepts POST requests" do
    it "Without arguements request will fail" do
      post "/api/v1/store"

      expect(response).not_to be_successful
      expect(response.status).to eq(400)
    end
  end
end
