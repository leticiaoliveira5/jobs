# frozen_string_literal: true

class AddLimitDateToJobOpportunity < ActiveRecord::Migration[5.2]
  def change
    add_column :job_opportunities, :limit_date, :date_field
  end
end
