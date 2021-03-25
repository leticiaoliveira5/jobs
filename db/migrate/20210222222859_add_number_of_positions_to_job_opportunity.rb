# frozen_string_literal: true

class AddNumberOfPositionsToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :number_of_positions, :integer
  end
end
