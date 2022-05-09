class AddFirstnameToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :firstname, :string
  end
end
