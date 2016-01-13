# RSpec.feature "visitor can view travesty index" do
#   scenario "visitor sees all items for a travesty" do
#     travesty = Travesty.create(title: "Environmental Disaster")
#     travesty_2 = Travesty.create(title: "Endangered Species Culling")
#     item = Item.create(title: "Oil Barrel",
#                        description: "Spills Oil",
#                        price: 10,
#                        travesty_id: travesty.id,
#                        image_url: "http://cdn1.theinertia.com/wp-content/uploads/2010/12/oil-barrel-1.jpg")
#     item_2 = Item.create(title: "6-pack Plastic Ring Dump",
#                          description: "10,000 uncut plastic rings dumped into the majestic Pacific",
#                          price: 5000,
#                          travesty_id: travesty.id,
#                          image_url: "http://coastalcare.org/wp-content/images/issues/pollution/plastic/Turle-eats-plastic.jpg")
#     item_3 = Item.create(title: "Black Rhino hunting license",
#                          travesty_id: travesty_2.id,
#                          description: "Get em while they're here, mother not included.",
#                          price: 20000,
#                          image_url: "http://www.robertwinslowphoto.com/Animals/African-and-Asian-Animals-1/Rhinos-Black/i-D7cp8SC/0/O/A-755H-08W8C.jpg")
#     item_4 = Item.create(title: "Bowhead Whale hunting license",
#                          travesty_id: travesty_2.id,
#                          description: "Enough fat to light 10 million candles",
#                          price: 10000,
#                          image_url: "http://cdn2.arkive.org/media/8F/8F0FEDA2-4DBE-402D-85B4-B271736355AE/Presentation.Large/Bowhead-whale-caught-by-Inuit-subsistence-whalers.jpg")
#
#     travesty = repo.travesties[0]
#     travesty_2 = repo.travesties[1]
#
#     visit travesty_path(travesty)
#
#     expect(page).to have_content(travesty.title)
#     expect(page).to have_content(trave)
#     expect(page).to have_content(item.description)
#     expect(page).to have_content(item.price)
#     expect(page).to have_content(item_2.title)
#     expect(page).to have_content(item_2.description)
#     expect(page).to have_content(item_2.price)
#
#     visit travesty_path(travesty_2)
#
#     expect(page).to have_content(item_3.title)
#     expect(page).to have_content(item_3.description)
#     expect(page).to have_content(item_3.price)
#     expect(page).to have_content(item_4.title)
#     expect(page).to have_content(item_4.description)
#     expect(page).to have_content(item_4.price)
#   end
# end
