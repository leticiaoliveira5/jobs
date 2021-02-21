class AddSurnameToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :surname, :string
  end
end
