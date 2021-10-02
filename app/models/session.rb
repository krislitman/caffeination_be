class Session < ApplicationRecord
  validates :user_id, presence: true
end
