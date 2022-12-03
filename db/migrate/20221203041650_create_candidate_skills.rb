class CreateCandidateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_skills do |t|
      t.bigint :candidate_id
      t.bigint :skill_id
      t.timestamps
    end
  end
end
