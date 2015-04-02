require 'rails_helper'

RSpec.describe User, type: :model do
   it { should validate_presence_of :email }
   #it { should validate_presence_of :lastname }

   it "by default isn't admin" do
    expect(User.new).to_not be_admin
  end
end
