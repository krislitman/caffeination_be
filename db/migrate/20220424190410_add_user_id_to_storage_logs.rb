class AddUserIdToStorageLogs < ActiveRecord::Migration[6.1]
  def change
	add_reference :storage_logs, :user, foreign_key: :true
	add_column :user, :first_name, :string
	add_column :user, :last_name, :string
	add_column :user, :username, :string
	add_column :user, :email, :string
	add_column :user, :zipcode, :string
  end
end
