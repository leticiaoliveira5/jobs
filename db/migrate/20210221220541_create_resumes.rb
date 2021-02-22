class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
