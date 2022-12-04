class CreateCandidateSkill < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_skills do |t|
      t.bigint :candidate_id
      t.bigint :skill_id
      t.integer :level
      t.timestamps
    end

    add_index :candidate_skills, [:skill_id, :candidate_id], unique: true
  end
end
