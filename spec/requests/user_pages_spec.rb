require 'spec_helper'

describe "User management" do

  subject { page }

  def fill_in_signup_form
    fill_in "First name" , with: "Nick"
    fill_in "Last name" , with: "O'Neill"
    fill_in "Email" , with: "tester@testing.com"
    fill_in "Password" , with: "foobar"
    fill_in "Confirm Password" , with: "foobar"
    check('Terms of service')
  end

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { "Continue" }

    describe "registration form elements" do
    	it { should have_selector('form' , :id => 'signup-form' ) }
    	it { should have_selector('input' , :name => 'first_name') }
    	it { should have_selector('input' , :name => 'last_name') }
    	it { should have_selector('input' , :name => 'email') }
    	it { should have_selector('input' , :name => 'tos' ) }
    end

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      it "should require a valid email" do
        pending "validate the user's email address, try fake emails"
      end

      it "should require a valid password" do
        pending "make sure the password is acceptable length, etc"
        pending "make sure password and confirm password match"
      end

      it "should require terms confirmation" do
        uncheck('Terms of service')
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before { fill_in_signup_form }

      it "should create a user" do
        #save_and_open_page
        expect { click_button submit }.to change(User , :count).by(1)
      end
    end  
  end
  
  describe "edit profile" do
  	pending "create an edit profile page for once a user is logged in"
  end
end