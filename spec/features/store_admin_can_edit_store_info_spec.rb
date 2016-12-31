require 'rails_helper'

RSpec.feature "store admin visits dashboard" do
  scenario "clicks link to edit store info and edits the store info" do
    category_1 = create(:category_with_items, items_count: 1)
    item_1 = category_1.items.first

    store_admin = create(:user, role: 1)
    store = create(:store, user_id: store_admin.id)
    user = create(:user, role: 0)

    visit login_path
    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)
    click_on "Edit Store Info"

    expect(current_path).to eq(edit_store_path(store.slug))

    fill_in "Title", with: "New Title"
    fill_in "Description", with: "New Description"
    fill_in "Image Url", with: "New Image Url"
    fill_in "Accredidations", with: "A new accredidation"

    click_on "Submit"
    expect(current_path).to eq('/stores/new-title/dashboard')

    expect(page).to have_content("New Title")
    expect(page).to have_content("New Description")
  end

  scenario "clicks link to edit store info and edits the store info" do
    category_1 = create(:category_with_items, items_count: 1)
    item_1 = category_1.items.first

    store_admin = create(:user, role: 1)
    store = create(:store, user_id: store_admin.id)
    user = create(:user, role: 0)

    visit login_path
    fill_in "Username", :with => store_admin.username
    fill_in "Password", :with => "password"
    click_on "Sign In"

    expect(current_path).to eq(store_dashboard_index_path(store.slug))

    expect(page).to have_content(store.title)
    expect(page).to have_content(store.description)
    click_on "Edit Store Info"

    expect(current_path).to eq(edit_store_path(store.slug))

    fill_in "Title", with: nil
    fill_in "Description", with: nil
    fill_in "Image Url", with: nil
    fill_in "Accredidations", with: nil

    click_on "Submit"
    expect(current_path).to eq(edit_store_path(store.slug))

    expect(page).to have_content(store.errors.full_messages.join(", "))
  end
end
