require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validation' do
    it { is_expected.to validate_numericality_of(:number) }
  end
end
