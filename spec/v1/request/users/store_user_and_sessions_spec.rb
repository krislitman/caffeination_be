require "rails_helper"

RSpec.describe "api/v1/store", type: :request do
  context "Only accepts POST requests" do
    get "api/v1/store"
    data = JSON.parse(response.body)
    expect(response).not_to be_successful
  end
end
