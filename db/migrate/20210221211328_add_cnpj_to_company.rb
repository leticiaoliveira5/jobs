class AddCnpjToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :cnpj, :integer
  end
end
