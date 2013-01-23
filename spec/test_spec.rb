require 'capybara/rspec'
require 'capybara/webkit'
Capybara.default_driver = :webkit

describe 'Yii Application', type: :feature do
	before :each do
		visit 'http://localhost/final'
	end

	#This code uses an empty yii framework skeleton as a testing model
	describe "Home Page" do
		it "should contain the default text" do
			page.should have_content 'Welcome'
			page.should have_content 'Congratulations! You have successfully created your Yii application.'
		end
	end

	describe "Navigation" do
		it "should contain navigation links" do
			page.should have_link 'Home'
			page.should have_link 'About'
			page.should have_link 'Contact'
			page.should have_link 'Login'
		end
		
		it "should allow users to login", js: true do
			page.should have_link 'Login'
			page.should_not have_link 'Logout'
			click_link 'Login'
			page.should have_content 'Please fill out the following form with your login credentials:'
			fill_in 'LoginForm_username', with: 'admin'
			fill_in 'LoginForm_password', with: 'admin'
			page.should_not have_link 'Logout'
			click_button 'Login'
			page.should have_link 'Logout'
		end
	end
end
