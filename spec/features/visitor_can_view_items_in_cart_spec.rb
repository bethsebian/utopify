# require 'rails_helper'
#
# RSpec.feature "visitor can view items in cart" do
#     scenario "they see their cart items" do
#
#     travesty = Travesty.create(title: "Environmental Disaster")
#     travesty_2 = Travesty.create(title: "Endangered Species Culling")
#     item = Item.create(title: "oil barrel",
#                       description: "holds oil",
#                       price: 10,
#                       travesty_id: travesty.id,
#                       image_url: "http://cdn1.theinertia.com/wp-content/uploads/2010/12/oil-barrel-1.jpg")
#
#     item_2 = Item.create(title: "Black rhino hunting license",
#                          travesty_id: travesty_2.id,
#                          description: "get em while they're here, mother not included",
#                          price: 20000,
#                          image_url: "http://www.robertwinslowphoto.com/Animals/African-and-Asian-Animals-1/Rhinos-Black/i-D7cp8SC/0/O/A-755H-08W8C.jpg")
#
# 	  visit '/items'
#
#     expect(page).to have_content("My Cart: 0")
#
#     click_button("#{item.id}_add_button")
#     click_button("#{item_2.id}_add_button")
#
#     expect(page).to have_content("My Cart: 2")
#
#     click_on "My Cart"
#
#     expect(page).to have_content(item.title)
#     expect(page).to have_content(item.description)
#     expect(page).to have_content(item.price)
#     expect(page).to have_css("##{item.id}_item")
#
#     expect(page).to have_content(item_2.title)
#     expect(page).to have_content(item_2.description)
#     expect(page).to have_content(item_2.price)
#     expect(page).to have_css("##{item_2.id}_item")
#   end
# end
