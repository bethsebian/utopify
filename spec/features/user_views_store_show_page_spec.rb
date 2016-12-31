require 'rails_helper'

RSpec.feature "logged in user goes to show page" do
  scenario "and sees stores items" do
    user = create(:user, role: 0)
    store = create(:store)
    item_1 = create(:item, store_id: store.id)
    item_2 = create(:item, store_id: store.id)
    item_3 = create(:item, store_id: store.id)

    visit root_path
    click_on "Login"

    page.fill_in 'Username', with: user.username
    page.fill_in 'Password', with: user.password
    click_on "Sign In"

    visit store_path(store.slug)

    expect(current_path).to eq(store_path(store.slug))
    expect(page).to have_content("#{item_1.title}")
    expect(page).to have_content("#{item_2.title}")
    expect(page).to have_content("#{item_3.title}")

    expect(page).to have_css("#card-store-title", :count => store.items.count )
  end
end
