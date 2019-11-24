require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name,email, password, password_confirmation " do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  
  it "is invalid with name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors.messages[:name]).to include("can't be blank")
  end

  it "is invalid with name" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors.messages[:email]).to include("can't be blank")
  end

end
