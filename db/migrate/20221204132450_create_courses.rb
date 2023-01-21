class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.bigint :candidate_id, null: false
      t.string :title, null: false
      t.text :skills, array: true, default: []
      t.string :certificate_link
      t.string :description, limit: 255
      t.timestamps
    end
  end
end
