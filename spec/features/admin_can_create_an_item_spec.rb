require 'rails_helper'

RSpec.feature "Admin can create an item" do
  scenario "Admin can see new item in travesty page" do

    db_repo = FactoryJordan.new
    db_repo.create_travesty(1)

    admin = User.create(first_name: "mister",
                        last_name: "admin",
                        username: "admin",
                        password: "admin",
                        role: 1)


    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit new_admin_item_path

    fill_in "Title", with: "Aresenicify Water Sources"
    fill_in "Description", with: "There will be no investigation, cause they'll all be dead!"
    fill_in "Image URL", with: "http://www.survivalreadyblog.com/uploads/1/4/1/2/1412634/7530107_orig.jpg"
    fill_in "item_price", with: "50"
    select "Environmental Disasters", from: "item[travesty_id]"
    click_on "Create Item"

    item = Item.find_by(title: "Aresenicify Water Sources")

    expect(current_path).to eq admin_items_path
    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_content item.price
  end
end
