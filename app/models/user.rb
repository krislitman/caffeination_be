class User < ApplicationRecord
	validates :reference_id, presence: true
	validates :configuration, presence: true
end
