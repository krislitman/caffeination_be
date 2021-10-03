require "rails_helper"

RSpec.describe Session, type: :model do
  context "Validations" do
    it { should validate_presence_of :user_id }
  end
end
