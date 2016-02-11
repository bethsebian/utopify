require 'rails_helper'

RSpec.feature "platform admin visits dashboard clicks link to edit a category" do
	scenario "edits the category info properly" do
    category_1 = create(:category_with_items, items_count: 1)
		item_1 = category_1.items.first
		store_admin = create(:user, role: 1)
		store = create(:store, user_id: store_admin.id)
		platform_admin = create(:user, role: 2)

    visit login_path
    fill_in "Username", :with => platform_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(platform_admin_dashboard_index_path)

    expect(page).to have_content("Site Administrator Dashboard")

		within("#all-categories") do
			expect(page).to have_content(category_1.title)
      click_on "Edit"
		end

		expect(current_path).to eq(edit_category_path(category_1.slug))

    within("#edit-item-form") do
    	fill_in "Title", with: "New Category Title"
    	fill_in "Image Url", with: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi33_2fiezKAhVnuYMKHXjtANkQjRwIAw&url=http%3A%2F%2Fjosephcphillips.com%2F2015%2F07%2Fof-course-bill-cosby-is-guilty%2F&psig=AFQjCNEMITizMWYxf5CZgZDU6BWWlr6a6w&ust=1455155083470723	"
    	click_on "Submit"
    end
		expect(current_path).to eq(platform_admin_dashboard_index_path)
  #
		within("#all-categories") do
			expect(page).to have_content("New Category Title")
		end
  end

	scenario "fills in the form wrong and is redirected to the new item page" do
		category_1 = create(:category_with_items, items_count: 1)
		item_1 = category_1.items.first
		store_admin = create(:user, role: 1)
		store = create(:store, user_id: store_admin.id)
		platform_admin = create(:user, role: 2)

    visit login_path
    fill_in "Username", :with => platform_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(platform_admin_dashboard_index_path)

    expect(page).to have_content("Site Administrator Dashboard")

		within("#all-categories") do
			expect(page).to have_content(category_1.title)
      click_on "Edit"
		end

		expect(current_path).to eq(edit_category_path(category_1.slug))

    within("#edit-item-form") do
    	fill_in "Title", with: nil
    	fill_in "Image Url", with: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi33_2fiezKAhVnuYMKHXjtANkQjRwIAw&url=http%3A%2F%2Fjosephcphillips.com%2F2015%2F07%2Fof-course-bill-cosby-is-guilty%2F&psig=AFQjCNEMITizMWYxf5CZgZDU6BWWlr6a6w&ust=1455155083470723	"
    	click_on "Submit"
    end
		expect(current_path).to eq(edit_category_path(category_1.slug))
  end
end
