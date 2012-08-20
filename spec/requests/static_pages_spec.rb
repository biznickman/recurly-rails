require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  	it "should have the content 'Paid App'" do
  		visit '/'
  		page.should have_selector('h1' , text: 'Paid App')
  	end
  end

  describe "Pricing page" do 
  	before { 
  		visit '/pricing'
  	}

  	it "should have a 'Pricing' on the page" do
  		page.should have_content("Pricing")
  	end
  end
end
