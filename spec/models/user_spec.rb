require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of :email }
  end

  describe "relationships" do
    it "can own links" do
      link = create(:link)
      user = create(:user)
      user.links << link
      expect(user.links.first).to eq(link)
    end
  end
end
