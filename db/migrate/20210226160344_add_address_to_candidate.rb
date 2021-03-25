# frozen_string_literal: true

class AddAddressToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :address, :string
  end
end
