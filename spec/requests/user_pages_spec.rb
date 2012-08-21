require 'spec_helper'

describe "User management:" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    describe "registration form elements" do
    	it { should have_selector('form' , :id => 'signup-form' ) }
    	it { should have_selector('input' , :name => 'first_name') }
    	it { should have_selector('input' , :name => 'last_name') }
    	it { should have_selector('input' , :name => 'email') }
    	it { should have_selector('input' , :name => 'tos' ) }
    end

    it "should require a valid email" do
    	pending "validate the user's email address, try fake emails"
    end

    it "should require a valid password" do
    	pending "make sure the password is acceptable length, etc"
    	pending "make sure password and confirm password match"
    end

    it "should require terms confirmation" do
    	pending "ensure terms are agreed to"
    end
  end

  describe "edit profile" do
  	pending "create an edit profile page for once a user is logged in"
  end
end