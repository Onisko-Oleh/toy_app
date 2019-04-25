require 'rails_helper'

RSpec.describe User, type: :model do

  before { @user = User.new(name: "Example User", email: "user@example.com",
                            password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to( :password_digest) }
  it { should respond_to (:password) }
  it { should respond_to (:password_confirmation) }
  it { should respond_to (:remember_token) }
  it { should respond_to (:authenticate) }

  it { should be_valid }

  # Name should be present
  describe "when name is not present" do
  	before { @user.name = " " }
  	it     { should_not be_valid }
  end

  # Email should be present
  describe "when email is not present" do
    before { @user.email = " " }
    it     { should_not be_valid }

end

  # Name should not be too long
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it     { should_not be_valid }

end

  # Email should not be too long
  describe "when email is too long" do
    before { @user.email = "a" * 244 + "@example.com" }
    it     { should_not be_valid }
  end

  describe "when email is invalid - lol"
    it "should be invalid" do
        invalid_addresess = %w[oleh@example,com oleh_examlpe_at.com
        oleh.example.com. oleh+example.com]
        invalid_addresess.each do |invalid_address|
            @user.email = invalid_address
            expect(@user).not_to be_valid
        end
    end

  describe "when email is valid"
    it "should be valid" do
        valid_addresess = %w[oleh@example.COM O_Oleh@f.b.org OLEH@EXAMPLE.COM]
        valid_addresess.each do |valid_address|
            @user.email = valid_address
            expect(@user).to be_valid
        end
    end
end