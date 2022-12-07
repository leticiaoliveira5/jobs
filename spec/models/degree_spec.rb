require 'rails_helper'

RSpec.describe Degree, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:candidate) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'enum' do
    it { is_expected.to define_enum_for(:kind)
    .with_values(%i[diploma bachelor graduate master doctorate]) }
  end
end
