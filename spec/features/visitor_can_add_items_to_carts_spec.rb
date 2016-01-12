require 'rails_helper'

RSpec.feature "visitor can add items to cart" do
  scenario "cart shows number of items in cart" do

    travesty = Travesty.create(title: "Environmental Disaster")
    travesty_2 = Travesty.create(title: "Endangered Species Culling")
    item = Item.create(title: "oil barrel",
                       description: "holds oil",
                       price: 10,
                       travesty_id: travesty.id,
                       image_url: "http://cdn1.theinertia.com/wp-content/uploads/2010/12/oil-barrel-1.jpg")
    item_2 = Item.create(title: "Black rhino hunting license",
                         travesty_id: travesty_2.id,
                         description: "get em while they're here, mother not included",
                         price: 20000,
                         image_url: "http://www.robertwinslowphoto.com/Animals/African-and-Asian-Animals-1/Rhinos-Black/i-D7cp8SC/0/O/A-755H-08W8C.jpg")

    visit '/items'

    expect(page).to have_content("My Cart: 0")

    first(:button, 'Add to cart').click

    expect(page).to have_content("My Cart: 1")
    expect(page).to have_content("You have 1 item in your cart.")
  end
end
