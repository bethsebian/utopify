require 'rails_helper'

RSpec.feature "platform admin visits dashboard clicks link to add a new item" do
	scenario "ceates a new item and sees the item details in the dashboard items table" do
    category_1 = create(:category_with_items, items_count: 1)

		item_1 = category_1.items.first

		platform_admin = create(:user, role: 2)
		# store = create(:store, user_id: store_admin.id)
		# user = create(:user, role: 0)

		# item_1.store = store
		# item_1.save

    visit login_path
    fill_in "Username", :with => platform_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(platform_admin_dashboard_index)

    expect(page).to have_content("Site Administrator Dashboard")

	# 	within("") do
	# 		expect(page).to have_content()
	# 		expect(page).to have_content()
  #     click_on ""
	# 	end
  #   expect(current_path).to eq()
  #
  #   within("#new-item-form") do
  #   	fill_in "Title", with: "New Item"
  #   	fill_in "Description", with: "New description"
  #   	fill_in "Image Url", with: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi33_2fiezKAhVnuYMKHXjtANkQjRwIAw&url=http%3A%2F%2Fjosephcphillips.com%2F2015%2F07%2Fof-course-bill-cosby-is-guilty%2F&psig=AFQjCNEMITizMWYxf5CZgZDU6BWWlr6a6w&ust=1455155083470723	"
	# 		fill_in "Price", with: 567
	# 		# select "value[2]", :from => "item[category]"
  #   	click_on "Submit"
  #   end
	# 	expect(current_path).to eq(store_dashboard_index_path(store.slug))
  #
	# 	within(".store-items-dashboard-table") do
	# 		expect(page).to have_content(store.items.second.description)
	# 	end
  # end
  #
	# scenario "fills in the form wrong and is redirected to the new item page" do
  # end
end
