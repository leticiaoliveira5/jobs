class AddPlaceToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :place, :string
  end
end
