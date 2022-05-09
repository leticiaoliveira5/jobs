class AddJobLevelToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :job_level, :string
  end
end
