require 'rails_helper'

RSpec.feature "visitor can view travesty index" do
  scenario "visitor sees all items for a travesty" do

    db_repo = FactoryJordan.new
    db_repo.create_all

    travesty_1 = db_repo.travesties[0]
    item_1 = travesty_1.items[0]
    item_2 = travesty_1.items[1]

    travesty_2 = db_repo.travesties[1]
    item_3 = travesty_2.items[2]
    item_4 = travesty_2.items[3]

    visit travesty_path(travesty_1)

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)

    visit travesty_path(travesty_2)

    expect(page).to have_content(item_3.title)
    expect(page).to have_content(item_3.description)
    expect(page).to have_content(item_3.price)
    expect(page).to have_content(item_4.title)
    expect(page).to have_content(item_4.description)
    expect(page).to have_content("$8,765.00")
  end
end
