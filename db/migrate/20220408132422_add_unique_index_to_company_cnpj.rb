class AddUniqueIndexToCompanyCnpj < ActiveRecord::Migration[6.1]
  def change
    add_index :companies, :cnpj, unique: true
  end
end
