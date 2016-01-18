require 'rails_helper'

RSpec.feature "user can view retired item" do
  scenario "but cannot order item" do
    user = User.create(
      first_name: "Jordan",
      last_name: "Lawler",
      username: "jlawler",
      password: "password"
    )

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    travesty = Travesty.create(title: "Environmental Disasters")

    item = travesty.items.create(
      title: "Item title",
      description: "Item description",
      price: 11,
      image_url: "app/assets/images/water_contamination.jpg",
      travesty_id: 1
    )

		visit item_path(item)

		expect(page).to have_button "Add to cart"

		item.active = false
		item.save
		visit item_path(item)

		expect(page).to_not have_button "Add to cart"
  end
end