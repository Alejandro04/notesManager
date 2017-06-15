require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:email) }
  it { should_not allow_value("alejandro@ok").for(:email) }
  it { should allow_value("alejandro@ok.com").for(:email) }

  it "should not create a user if the email does not exist" do
    expect {
      User.new({name: "alejandro", email: "", password_digest: "aaaaaaaa" })
    }.to change(User, :count).by(0)
  end

  it "deberia encontrar un usuario si el email ya existe" do  
    expect {
        User.find_by email: 'alejo@alejo.com'
    }.to change(User, :count).by(0)
  end



end
