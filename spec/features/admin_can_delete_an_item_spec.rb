require 'rails_helper'

RSpec.feature "Admin can delete an item" do
  scenario "Admin can delete an existing item and is redirected to items index" do
    admin = User.create(first_name: "mister",
                        last_name: "admin",
                        username: "admin",
                        password: "admin",
                        role: 1)
    travesty = Travesty.create(title: "Environmental Disasters")
    item = travesty.items.create(title: "Arsenicify Water Sources",
                       description: "There will be no investigation, cause they'll all be dead!",
                       price: 10,
                       image_url: "http://www.survivalreadyblog.com/uploads/1/4/1/2/1412634/7530107_orig.jpg")

    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit admin_items_path
    save_and_open_page

    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_content item.price

    click_on "Delete"

    expect(page).to_not have_content item.title
    expect(page).to_not have_content item.description
    expect(page).to_not have_content item.price
  end
end
