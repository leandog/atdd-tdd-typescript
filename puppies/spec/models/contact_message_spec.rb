require 'rails_helper'

RSpec.describe ContactMessage, type: :model do
  let(:message) {ContactMessage.new}

  it "responds to name" do
    expect(message).to respond_to(:name)
  end

  it "responds to email" do
    expect(message).to respond_to(:email)
  end

  it "responds to body" do
    expect(message).to respond_to(:body)
  end

  it "should be valid when all attrs are set" do
    attrs = {
      name: 'stephen',
      email: 'stephen@example.org',
      body: 'kthnxbai'
    }

    msg = ContactMessage.new attrs
    expect(msg).to be_valid
  end
end
