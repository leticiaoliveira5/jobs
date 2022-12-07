class CreateDegrees < ActiveRecord::Migration[7.0]
  def change
    create_table :degrees do |t|
      t.bigint :candidate_id, null: false
      t.string :title, null: false
      t.integer :graduation_year, null: false
      t.string :institution
      t.integer :kind
      t.timestamps
    end
  end
end
