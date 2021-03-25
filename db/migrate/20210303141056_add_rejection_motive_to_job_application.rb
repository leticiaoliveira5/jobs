# frozen_string_literal: true

class AddRejectionMotiveToJobApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :rejection_motive, :string
  end
end
