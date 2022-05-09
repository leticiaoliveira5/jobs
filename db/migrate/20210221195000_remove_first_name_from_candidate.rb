class RemoveFirstNameFromCandidate < ActiveRecord::Migration[5.2]
  def change
    remove_column :candidates, :first_name, :string
  end
end
