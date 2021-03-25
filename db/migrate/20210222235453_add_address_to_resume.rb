# frozen_string_literal: true

class AddAddressToResume < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :address, :string
  end
end
