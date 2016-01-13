require 'rails_helper'

RSpec.feature "visitor can view items" do
  scenario "index displays all current items for visitor" do

    db_repo = FactoryJordan.new
    db_repo.create_travesty("Environmental Disasters")
    travesty = db_repo.travesties
    item_1 = db_repo.items[0]
    item_2 = db_repo.items[1]

    visit '/items'

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    # expect(page).to have_css("##{item.id}_item")
    expect(page).to have_content(item_1.travesty.title)
    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
    # expect(page).to have_css("##{item_2.id}_item")
    expect(page).to have_content(item_2.travesty.title)
  end
end
