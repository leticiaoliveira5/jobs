class AddDescriptionToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :description, :string
  end
end
