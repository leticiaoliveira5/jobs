class AddDocumentToCandidate < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :document, :string
    add_index :candidates, :document, unique: true
  end
end
