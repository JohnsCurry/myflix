require 'spec_helper'

describe Invitation do
  it {should validate_presence_of(:recipient_name) }
  it {should validate_presence_of(:recipient_email) }
  it {should validate_presence_of(:message) }

  it_behaves_like "tokenable" do
    let(:object) { Fabricate(:invitation, recipient_name: "Mojo jojo", recipient_email: "mojo@jojo.com", message: "curses") }
  end
end
