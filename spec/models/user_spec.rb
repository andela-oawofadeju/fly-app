require "rails_helper"

RSpec.describe User, type: :model do
  it "is a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  context "when it's instance methods are called" do
    it { expect(user).to respond_to(:first_name) }
    it { expect(user).to respond_to(:email) }
    it { expect(user).to respond_to(:password) }
  end

  describe "validations" do
    it "validates length of password" do
      expect(user).to validate_length_of(:password)
    end

    it "validates presence of first name" do
      expect(user).to validate_presence_of(:first_name)
    end

    it "validates presence of last name" do
      expect(user).to validate_presence_of(:last_name)
    end

    it "validates presence of email" do
      expect(user).to validate_presence_of(:email)
    end

    it "validates uniqueness of email" do
      expect(user).to validate_uniqueness_of(:email)
    end
  end
end
