# require 'rails_helper'
#
# RSpec.feature "visitor can add items to cart" do
#   scenario "cart shows number of items in cart" do
#
#     travesty = Travesty.create(title: "Environmental Disaster")
#     item = Item.create(title: "oil barrel",
#                        description: "holds oil",
#                        price: 10,
#                        travesty_id: travesty.id,
#                        image_url: "http://cdn1.theinertia.com/wp-content/uploads/2010/12/oil-barrel-1.jpg")
#
#     visit '/items'
#
#     expect(page).to have_content("My Cart: 0")
#
#     first(:button, 'Add to cart').click
#
#     expect(page).to have_content("My Cart: 1")
#     expect(page).to have_content("You have 1 item in your cart.")
#   end
# end
