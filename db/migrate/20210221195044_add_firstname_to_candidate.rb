class AddFirstnameToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :firstname, :string
  end
end
