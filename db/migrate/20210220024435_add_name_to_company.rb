# frozen_string_literal: true

class AddNameToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :name, :string
  end
end
