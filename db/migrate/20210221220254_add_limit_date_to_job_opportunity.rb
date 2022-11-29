class AddLimitDateToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :limit_date, :datetime
  end
end
