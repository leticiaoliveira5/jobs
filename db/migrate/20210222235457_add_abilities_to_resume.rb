# frozen_string_literal: true

class AddAbilitiesToResume < ActiveRecord::Migration[5.2]
  def change
    add_column :resumes, :abilities, :string
  end
end
