class CreateStorageLog < ActiveRecord::Migration[6.1]
  def change
    create_table :storage_logs do |t|
      t.jsonb :configuration, :null => false, default: '{}'

      t.timestamps
    end
  end
end
