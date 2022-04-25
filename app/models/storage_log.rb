class StorageLog < ApplicationRecord
	validates :configuration, presence: true

	belongs_to :user
end
