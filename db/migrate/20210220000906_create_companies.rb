class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies, &:timestamps
  end
end
