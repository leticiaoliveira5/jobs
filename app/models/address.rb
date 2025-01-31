# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :resource, polymorphic: true

  validates :street, :neighborhood, :city, :zipcode, :country, presence: true
  validates :number, numericality: true, allow_blank: true

  def to_line
    [street, number, neighborhood, city, state, country, zipcode].compact.join(', ')
  end

  def short_form
    "#{city}, #{country}"
  end
end
