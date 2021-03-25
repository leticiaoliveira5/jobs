# frozen_string_literal: true

class AddAboutMeToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :about_me, :string
  end
end
