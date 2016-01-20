require 'rails_helper'

RSpec.feature "doomsday flash message is shown" do
  scenario "user who has spent greater than $500 is shown doomsday flash message" do
    travesties = create_list(:travesty_with_items, 1)
    user = create(:user)
    item_1 = travesty.items.first
    item_2 = travesty.items[1]
    ApplicationController.stub(:current_user).and_return(user)

    visit item_path(item_1)
    first(:button, 'Add to cart').click
    visit item_path(item_2)
    first(:button, 'Add to cart').click

    save_and_open_page

    visit items_path

  end
end
