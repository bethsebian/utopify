# require 'rails_helper'
#
# RSpec.feature "user can view past orders" do
#   scenario "authenticated user sees index of orders" do
#     db_repo = FactoryJordan.new
#     user = db_repo.create_users(1)[0]
#
#     visit '/'
#
#     click_link "Login"
#
#     expect(current_path).to eq login_path
#
#     fill_in "Username", with: "jlawlz"
#     fill_in "Password", with: "password"
#
#     click_button "Submit"
#
#     user = User.find_by(username: 'jlawlz')
#
#     order = Order.create(status: "Paid",
#                          total_price: 12,
#                          user_id: user.id)
#
#     visit orders_path
#
#     expect(current_path).to eq orders_path
#
#     expect(page).to have_content "12"
#     expect(page).to have_content "Paid"
#   end
#
#   scenario "authenticated user cannot see other users orders" do
#     user = User.create(first_name: "default",
#                        last_name: "user",
#                        username: "default_user",
#                        password: "default",
#                        role: 0 )
#     user_2 = User.create(first_name: "default",
#                        last_name: "user",
#                        username: "default_user_2",
#                        password: "default",
#                        role: 0 )
#     order = user.orders.create(status: "Paid",
#                                total_price: 12)
#     order_2 = user.orders.create(status: "Pending",
#                                  total_price: 24)
#     order_3 = user_2.orders.create(status: "Cancelled",
#                                    total_price: 36)
#
#     visit login_path
#
#     fill_in "Username", with: user.username
#     fill_in "Password", with: user.password
#     click_button "Submit"
#
#     visit orders_path
#
#     expect(current_path).to eq orders_path
#     expect(page).to have_content order.status
#     expect(page).to have_content order.total_price
#     expect(page).to have_content order_2.status
#     expect(page).to have_content order_2.total_price
#     expect(page).to_not have_content order_3.status
#     expect(page).to_not have_content order_3.total_price
#   end
#
#
#
# end
