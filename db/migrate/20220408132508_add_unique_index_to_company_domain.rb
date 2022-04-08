class AddUniqueIndexToCompanyDomain < ActiveRecord::Migration[6.1]
  def change
    add_index :companies, :domain, unique: true
  end
end
