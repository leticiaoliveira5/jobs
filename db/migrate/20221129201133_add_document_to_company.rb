class AddDocumentToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :document, :string
    add_index :companies, :document, unique: true
  end
end
