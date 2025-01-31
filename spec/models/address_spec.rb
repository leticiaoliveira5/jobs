require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:zipcode) }
  end
end
