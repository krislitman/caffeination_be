class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :reference_id
      t.jsonb :configuration, :null => false, default: '{}'

      t.timestamps
    end
  end
end
