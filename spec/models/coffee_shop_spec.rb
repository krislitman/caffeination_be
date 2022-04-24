require "rails_helper"

RSpec.describe CoffeeShop, type: :model do
	context "Validations" do
		it { should validate_presence_of :yelp_id }
	end
	context "Relationships" do
		it { should belong_to :user }
	end
end
