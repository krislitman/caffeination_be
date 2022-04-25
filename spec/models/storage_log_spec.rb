require "rails_helper"

RSpec.describe StorageLog, type: :model do
	context "Validations" do
		it { should validate_presence_of :configuration }
	end
	context "Relationships" do
		it { should belong_to(:user) }
	end
end
