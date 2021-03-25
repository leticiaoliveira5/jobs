# frozen_string_literal: true

class AddJobTitleToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :job_title, :string
  end
end
