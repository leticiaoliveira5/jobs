# frozen_string_literal: true

class CreateJobOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :job_opportunities do |t|
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
