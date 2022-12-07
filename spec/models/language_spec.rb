require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:candidate) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:proficiency) }
  end

  describe 'enum' do
    it do
      expect(subject).to define_enum_for(:proficiency)
      .with_values(%i[beginner intermediate advanced fluent])
    end
  end
end
