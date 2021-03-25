# frozen_string_literal: true

class AddStatusToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :status, :integer, default: 0
  end
end
