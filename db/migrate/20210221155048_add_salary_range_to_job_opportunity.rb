# frozen_string_literal: true

class AddSalaryRangeToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :salary_range, :string
  end
end
