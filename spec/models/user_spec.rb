require 'spec_helper'

describe User do
  before { @user = User.new( first_name: "Nick" , last_name: "O'Neill" , email: "nick@holler.com" , password: "tester" , password_confirmation: "tester" , :tos => '1' ) }
  let( :min_password_length ){ 6 }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
  	describe "(first name)" do
  		before { @user.first_name = " " }
  		it { should_not be_valid }
  	end
  	describe "(last name)" do 
  		before { @user.last_name = " " }
  		it { should_not be_valid }
  	end
  end

  describe "when name is too long" do
  	describe "(first name)" do
  		before { @user.first_name = "a" * 51 }
  		it { should_not be_valid }
  	end
  	describe "(last name)" do
  		before { @user.last_name = "a" * 51 }
  		it { should_not be_valid }
  	end
  end

  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end

  describe "when email address is already taken" do
  	before do
  		user_with_same_email = @user.dup
  		user_with_same_email.email = @user.email.upcase
  		user_with_same_email.save
  	end

  	it { should_not be_valid }
  end

  describe "email address with mixed case" do 
  	let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

  	it "should be saved as all lower-case" do
  		@user.email = mixed_case_email
  		@user.save
  		@user.reload.email.should == mixed_case_email.downcase
  	end
  end

  describe "with a password that's too short" do 
  	before { @user.password = @user.password_confirmation = "a" * ( min_password_length - 1 ) }
  	it { should be_invalid }
  end

  describe "when password is not present" do
  	before { @user.password = @user.password_confirmation =  " " }
  	it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
  	before { @user.password_confirmation = nil }
  	it { should_not be_valid }
  end

  describe "return value of authenticate method" do
  	before { @user.save }
  	let(:found_user) { User.find_by_email(@user.email) }

  	describe "with valid password" do
  		it { should == found_user.authenticate(@user.password) }
  	end

  	describe "with invalid password" do
  		let(:user_for_invalid_password) { found_user.authenticate("invalid") }

  		it { should_not == user_for_invalid_password }
  		specify { user_for_invalid_password.should be_false }
  	end
  end
end
