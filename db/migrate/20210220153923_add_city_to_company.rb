# frozen_string_literal: true

class AddCityToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :city, :string
  end
end
