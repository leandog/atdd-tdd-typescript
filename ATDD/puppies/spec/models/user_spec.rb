require 'rails_helper'


RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build :user }

  describe "validations" do
    it "should be valid" do
      expect(user).to be_valid
    end

    it "should rquire a name" do
      user.name = nil
      expect(user).to have_errors_on(:name).with_message("can't be blank")
    end

    it "should ensure two users do not have the same name" do
      FactoryGirl.create(:user)
      expect(user).to have_errors_on(:name).with_message("has already been taken")
    end

    it "should require a password" do
      user.hashed_password = nil
      expect(user).to have_errors_on(:password).with_message("Missing password")
    end
  end

  describe "authentication" do
    it "should authenticate a user" do
      allow(User).to receive(:find_by_name).and_return(user)
      allow(User).to receive(:encrypt_password).and_return(user.hashed_password)
      expect(User.authenticate(user.name, user.password)).to eq(user)
    end
  end

  it "should encrypt the password" do
    allow(User).to receive(:encrypt_password).and_return('encrypted')
    user.password = 'pass'
    expect(user.hashed_password).to eq('encrypted')
  end

end
