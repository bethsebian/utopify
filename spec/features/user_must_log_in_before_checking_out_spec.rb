require 'rails_helper'

RSpec.feature "user not logged in adds items to cart" do
  scenario "clicks the checkout button and is taken to the login page" do
    user = create(:user)
    store = Store.create(title: "test", accreditations: ["Hurray"])
    category_1 = create(:category)
    item_1 = create(:item, category_id: category_1.id)
    store.items << [item_1]

    visit store_path(store.slug)
    expect(page).to have_content("My Cart: 0")

    first(:button, "Add To Cart").click
    expect(page).to have_content("My Cart: 1")
    click_on("My Cart")
    expect(page).to have_content(item_1.title)

    click_on("Checkout")
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please log in to check out")
  end

  scenario "clicks the checkout button, then logs in and can checkout" do
    user = create(:user)
    store = Store.create(title: "test", accreditations: ["Hurray"])
    category_1 = create(:category)
    item_1 = create(:item, category_id: category_1.id)
    store.items << [item_1]

    visit store_path(store.slug)
    expect(page).to have_content("My Cart: 0")

    first(:button, "Add To Cart").click
    expect(page).to have_content("My Cart: 1")
    click_on("My Cart")
    expect(page).to have_content(item_1.title)

    click_on("Checkout")
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please log in to check out")

    fill_in("Username", with: user.username)
    fill_in("Password", with: user.password)
    click_on("Sign In")

    expect(current_path).to eq(dashboard_path)
    click_on("My Cart")
    expect(page).to have_content(item_1.title)

    click_on("Checkout")
    expect(page).to have_content("Order was successfully placed.")
  end

end
