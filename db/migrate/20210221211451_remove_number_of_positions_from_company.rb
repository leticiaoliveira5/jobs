class RemoveNumberOfPositionsFromCompany < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :number_of_positions, :integer
  end
end
