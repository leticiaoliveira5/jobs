class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.bigint :resource_id, null: false
      t.string :resource_type, null: false
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.timestamps
    end

    remove_column :candidates, :address, :string
    remove_column :companies, :address, :string
  end
end
