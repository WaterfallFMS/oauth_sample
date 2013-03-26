class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,       :null => false
      t.string :email

      t.integer :tenant_id, :null => false

      # OAuth
      t.string :provider
      t.string :uid
      t.text   :details

      t.timestamps
    end
    add_index :users, [:tenant_id, :provider, :uid], :unique => true
  end
end
