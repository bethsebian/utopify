require 'rails_helper'

RSpec.feature "visitor can view items in cart" do
    scenario "they see their cart items" do

    db_repo = FactoryJordan.new
    db_repo.create_all
    item_1 = db_repo.items[0][0]
    item_2 = db_repo.items[0][1]

	  visit '/items'

    expect(page).to have_content("My Cart: 0")

    click_button("#{item_1.id}_add_button")
    click_button("#{item_2.id}_add_button")

    expect(page).to have_content("My Cart: 2")

    click_on "My Cart"

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_css("##{item_1.id}_item")

    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("##{item_2.id}_item")
  end
end
