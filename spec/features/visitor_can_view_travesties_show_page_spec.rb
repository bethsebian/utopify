require 'rails_helper'

RSpec.feature "Visitor navigates to travesty page" do
  scenario "sees expected travesty content" do
    travesty_1 = Travesty.create(
      title: "Environmental Disasters"
    )

    travesty_2 = Travesty.create(
      title: "Endangered Species Culling"
    )

    item_1 = travesty_1.items.create(
      title: "Title_1",
      description: "Description_1",
      price: 101,
      image_url: "app/assets/images/water_contamination.jpg",
    )
    item_2 = travesty_1.items.create(
      title: "Title_2",
      description: "Description_2",
      price: 202,
      image_url: "app/assets/images/water_contamination.jpg",
    )
    item_3 = travesty_2.items.create(
      title: "Title_3",
      description: "Description_3",
      price: 303,
      image_url: "app/assets/images/water_contamination.jpg",
    )
    item_4 = travesty_2.items.create(
      title: "Title_4",
      description: "Description_4",
      price: 404,
      image_url: "app/assets/images/water_contamination.jpg",
    )

    visit travesty_path(travesty_1)

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content("$101.00")
    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content("$202.00")

    visit travesty_path(travesty_2)

    expect(page).to have_content(item_3.title)
    expect(page).to have_content(item_3.description)
    expect(page).to have_content("$303.00")
    expect(page).to have_content(item_4.title)
    expect(page).to have_content(item_4.description)
    expect(page).to have_content("$404.00")
  end

  scenario "when they enter friendly travesty slug" do

    travesty_1 = Travesty.create(
      title: "Environmental Disasters"
    )

    item_1 = travesty_1.items.create(
      title: "Title_1",
      description: "Description_1",
      price: 101,
      image_url: "app/assets/images/water_contamination.jpg",
    )
    item_2 = travesty_1.items.create(
      title: "Title_2",
      description: "Description_2",
      price: 202,
      image_url: "app/assets/images/water_contamination.jpg",
    )

    visit "/travesties/#{travesty_1.slug}"
    expect(page).to have_content(travesty_1.title)
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content("$101.00")
    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content("$202.00")
  end
end