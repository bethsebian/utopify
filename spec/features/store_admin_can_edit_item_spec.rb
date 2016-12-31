require 'rails_helper'

RSpec.feature "admin visits dashboard clicks link to edit item" do
  scenario "admin edits an item and is redirected back to the dashboard" do
    category_1 = create(:category_with_items, items_count: 1)

    item_1 = category_1.items.first

    store_admin = create(:user, role: 1)
    store = create(:store, user_id: store_admin.id)
    user = create(:user, role: 0)

    item_1.store = store
    item_1.save

    visit login_path
    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)

    within(".store-items-dashboard-table") do
      expect(page).to have_content(store.items.first.title)
      expect(page).to have_content(store.items.first.description)
      click_on "Edit"
    end
    expect(current_path).to eq(edit_item_path(item_1))

    within("#edit-item-form") do
      fill_in "Title", with: "New Item"
      fill_in "Description", with: "New description"
      fill_in "Image Url", with: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi33_2fiezKAhVnuYMKHXjtANkQjRwIAw&url=http%3A%2F%2Fjosephcphillips.com%2F2015%2F07%2Fof-course-bill-cosby-is-guilty%2F&psig=AFQjCNEMITizMWYxf5CZgZDU6BWWlr6a6w&ust=1455155083470723  "
      fill_in "Price", with: 567
      # select "value[2]", :from => "item[category]"
      click_on "Submit"
    end
    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    within(".store-items-dashboard-table") do
      expect(page).to have_content("New description")
    end
    expect(page).to have_content("Your item was successfully edited")

  end

  scenario "fills in the form wrong and is redirected to the edit item page" do
    category_1 = create(:category_with_items, items_count: 1)

    item_1 = category_1.items.first

    store_admin = create(:user, role: 1)
    store = create(:store, user_id: store_admin.id)
    user = create(:user, role: 0)

    item_1.store = store
    item_1.save

    visit login_path
    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)

    within(".store-items-dashboard-table") do
      expect(page).to have_content(store.items.first.title)
      expect(page).to have_content(store.items.first.description)
      click_on "Edit"
    end
    expect(current_path).to eq(edit_item_path(item_1))
  end


end
