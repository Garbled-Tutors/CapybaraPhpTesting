require 'capybara/rspec'
require 'capybara/webkit'
Capybara.default_driver = :webkit

describe "testing", :type => :feature do
	it "tests" do
		visit 'http://localhost/final'
		page.should have_content 'Welcome'
	end
end
