RSpec.feature "user loggs in" do
  scenario "clicks a link to go to their dashboard" do
		user = create(:user)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => user.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.first_name}")

		expect(page).to have_content("My Dashboard")
		click_on("My Dashboard")
		expect(current_path).to eq(dashboard_path)

  end
end

RSpec.feature "store admin loggs in" do
	scenario "clicks a link to view thier store dashboard" do
		store_admin = create(:user, role: 1)
		store = create(:store, user_id: store_admin.id)
    visit root_path
    click_on "Login"

    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.first_name}")

		expect(page).to have_content("My Dashboard")
		click_on("My Dashboard")
		expect(current_path).to eq(dashboard_path)

	end
end

RSpec.feature "store admin loggs in" do
	scenario "store admin loggs in and clicks a link to view thier personal dashboard" do
		store_admin = create(:user, role: 1)
		store = create(:store, user_id: store_admin.id)
	end
end

RSpec.feature "platform admin visits store home page" do
	scenario "loggs in and clicks a link to view the site dashboard" do

	end
end

RSpec.feature "platform admin visits store home page" do
	scenario "loggs in and clicks a link to view their personal dashboard" do

	end
end
