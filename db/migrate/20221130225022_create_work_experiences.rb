class CreateWorkExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :work_experiences do |t|
      t.bigint :candidate_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :company_name
      t.string :description
      t.string :job_title
      t.integer :sector
      t.string :location
      t.integer :status
      t.timestamps
    end
  end
end
