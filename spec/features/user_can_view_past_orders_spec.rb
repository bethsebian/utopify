require 'rails_helper'

RSpec.feature "user can view past orders" do
  scenario "through the order show page" do
    user = User.create(
      first_name: "Jordan",
      last_name: "Lawler",
      username: "jlawler",
      password: "password"
    )

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    order = user.orders.create(
      status: "paid",
      total_price: 12,
      created_at: Time.new(2016, 01, 01),
      updated_at: Time.new(2016, 01, 02),
      user_id: user.id
    )

    travesty = Travesty.create(title: "Environmental Disasters")

    item = travesty.items.create(
      title: "Item title",
      description: "Item description",
      price: 11,
      image_url: "app/assets/images/water_contamination.jpg",
      travesty_id: 1
    )

    order_item_1 = order.order_items.create(
      item_id: item.id,
      qty: 4,
      unit_price: 3
    )

    visit orders_path

    expect(page).to have_content "Past Orders"
    expect(page).to have_link("Order ##{"%07d" % order.id.to_s}", href: order_path(order))

    click_link("Order ##{"%07d" % order.id.to_s}")

    expect(current_path).to eq order_path(order)
    expect(page).to have_content item.title
    expect(page).to have_content order_item_1.qty
    expect(page).to have_content (order_item_1.qty.to_i * order_item_1.unit_price.to_i)
    expect(page).to have_content order.status
    expect(page).to have_content order.total_price
    expect(page).to have_content order.created_at

    timestamp_before_update = order.updated_at
    order.status = "completed"
    order.save
    timestamp_after_update = order.updated_at
    visit current_path

    expect(page).to_not have_content timestamp_before_update
    expect(page).to have_content timestamp_after_update
  end
end