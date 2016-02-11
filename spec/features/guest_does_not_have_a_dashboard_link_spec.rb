require 'rails_helper'

RSpec.feature "guest visits store home page" do
	scenario "and does not see a link to his dashboard because he is not signed in" do
		visit root_path
		expect(page).to_not have_content("My Dashboard")
  end
end
