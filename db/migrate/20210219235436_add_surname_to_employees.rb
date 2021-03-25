# frozen_string_literal: true

class AddSurnameToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :surname, :string
  end
end
