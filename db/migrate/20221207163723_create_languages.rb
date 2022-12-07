class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.bigint :candidate_id, null: false
      t.integer :proficiency, null: false
      t.string :name, null: false, limit: 255
      t.timestamps
    end
  end
end
