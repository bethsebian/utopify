# As a guest,
# when I am on the homepage,
# and I click on “Sign Up”,
# I am directed to the new user page,
# and the path is ‘/users/new’
# and I fill in my first name with ‘’,
# and I fill in my last name with ‘’,
# and I fill in my username name with ‘’,
# and I fill in my password name with ‘’,
# and I fill in my password confirmation name with ‘’,
# and I click on Submit,
# I am directed to my User dashboard,
# and I see my name,
# and I see how long I’ve been a user,
# and I see a link in the navbar to “Sign Out

require 'rails_helper'


RSpec.feature "logged in user goes to show page" do
	scenario "and sees stores items" do
