class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string  :name,     :null => false
      t.integer :owner_id
      t.string  :type,     :null => false

      t.timestamps
    end
  end
end
