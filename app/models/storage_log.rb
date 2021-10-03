class StorageLog < ApplicationRecord
  validates :configuration, presence: true
end
