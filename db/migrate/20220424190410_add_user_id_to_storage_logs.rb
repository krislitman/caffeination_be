class AddUserIdToStorageLogs < ActiveRecord::Migration[6.1]
  def change
	add_reference :storage_logs, :user, foreign_key: :true
	add_column :users, :first_name, :string
	add_column :users, :last_name, :string
	add_column :users, :username, :string
	add_column :users, :email, :string
	add_column :users, :zipcode, :string
  end
end
