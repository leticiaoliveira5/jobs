class AddCpfToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :cpf, :integer
  end
end
