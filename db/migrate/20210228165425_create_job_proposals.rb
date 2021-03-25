# frozen_string_literal: true

class CreateJobProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :job_proposals do |t|
      t.string :message
      t.date :start_date
      t.integer :salary_proposal

      t.timestamps
    end
  end
end
