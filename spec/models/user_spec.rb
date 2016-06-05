require 'rails_helper'

RSpec.describe User, type: :model do
  describe "valid" do
    before do 
    	@user = FactoryGirl.create(:user)
    end

    subject { @user }

    it { should respond_to :name }
    it { should respond_to :email }
    it { should respond_to :password }
    it { should respond_to :password_confirmation }
    it { should respond_to :role_id }
    it { should be_valid }
  end

  describe "invalid" do
  	context "when name is empty" do
	    before do 
	    	@user = User.create(name: "", email: "test@test.com", password: "securepass", password_confirmation: "securepass")
	   	end

	    subject { @user }

	    it { should_not be_valid }
	end

	context "when email is nil" do
	    before do 
	    	@user = User.create(name: "Vasya", email: nil, password: "securepass", password_confirmation: "securepass")
	   	end

	    subject { @user }

	    it { should_not be_valid }
	end

	context "when password is shorter than 6 symbols" do
	    before do 
	    	@user = User.create(name: "Vasya", email: "test@test.com", password: "12345", password_confirmation: "12345")
	   	end

	    subject { @user }

	    it { should_not be_valid }
	end
  end

  it "has lowercase email" do 
	@user = User.create(name: "Vasya", email: "TEST@test.com", password: "securepass", password_confirmation: "securepass")
	expect(@user.email).to eq "test@test.com"
  end
end
