# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :resource, polymorphic: true

  validates :street, :neighborhood, :city, :zipcode, :country, presence: true
  validates :number, numericality: true, allow_blank: true
end
