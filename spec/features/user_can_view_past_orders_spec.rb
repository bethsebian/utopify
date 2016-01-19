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
      item_quantity: 4,
      item_price: 3
    )

    visit orders_path

    expect(page).to have_content "Past Orders"
    expect(page).to have_link("Order ##{"%07d" % order.id.to_s}", href: order_path(order))

    click_link("Order ##{"%07d" % order.id.to_s}")

    expect(current_path).to eq order_path(order)
    expect(page).to have_content item.title
    expect(page).to have_content order_item_1.item_quantity
    expect(page).to have_content (order_item_1.item_quantity.to_i * order_item_1.item_price.to_i)
    expect(page).to have_content order.status.capitalize
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

  scenario "authenticated user cannot see other users orders" do
    user = User.create(first_name: "default",
                       last_name: "user",
                       username: "default_user",
                       password: "default",
                       role: 0 )
    user_2 = User.create(first_name: "default",
                       last_name: "user",
                       username: "default_user_2",
                       password: "default",
                       role: 0 )
    order = user.orders.create(status: "Paid",
                               total_price: 12)
    order_2 = user.orders.create(status: "Pending",
                                 total_price: 24)
    order_3 = user_2.orders.create(status: "Cancelled",
                                   total_price: 36)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Submit"

    visit orders_path

    expect(current_path).to eq orders_path
    expect(page).to have_content order.status
    expect(page).to have_content number_to_currency(order.total_price)
    expect(page).to have_content order_2.status.capitalize
    expect(page).to have_content number_to_currency(order_2.total_price)
    expect(page).to_not have_content order_3.status
    expect(page).to_not have_content number_to_currency(order_3.total_price)
  end
end
