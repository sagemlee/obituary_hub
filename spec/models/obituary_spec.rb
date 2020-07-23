require 'rails_helper'

RSpec.describe Obituary, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
  end

  describe 'relationships' do
    it {should belong_to(:user)}
  end
end
