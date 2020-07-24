require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
  end

  describe "relationships" do
    it {should have_many(:obituaries)}
  end

  describe "methods" do
    it "has_obituary?" do
      user1 = create(:user)
      user2 = create(:user)
      obituary1 = create(:obituary, user_id: user1.id)
      obituary2 = create(:obituary, user_id: user2.id)
      expect(user1.has_obituary?(obituary1)).to eq(true)
      expect(user1.has_obituary?(obituary2)).to eq(false)
    end
  end
end
