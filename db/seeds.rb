
travesty = Travesty.create(title: "Environmental Disaster")
travesty_2 = Travesty.create(title: "Endangered Species Culling")

Item.create(title: "Oil Barrel",
            description: "holds oil",
            price: 10,
            travesty_id: travesty.id,
            image_url: "http://cdn1.theinertia.com/wp-content/uploads/2010/12/oil-barrel-1.jpg")

Item.create(title: "6 Pack Plastic Rings",
            description: "Great for hugging animals!",
            price: 1000,
            travesty_id: travesty.id,
            image_url: "http://cdn1.theinertia.com/wp-content/uploads/2010/12/oil-barrel-1.jpg")

Item.create(title: "HairDryer Icecap Melting Team",
            description: "Great for fun in the snow/water!",
            price: 10,
            travesty_id: travesty.id,
            image_url: "http://cdn1.theinertia.com/wp-content/uploads/2010/12/oil-barrel-1.jpg")

Item.create(title: "Black Rhino hunting license",
            travesty_id: travesty_2.id,
            description: "Get em while they're here, mother not included.",
            price: 20000,
            image_url: "http://www.robertwinslowphoto.com/Animals/African-and-Asian-Animals-1/Rhinos-Black/i-D7cp8SC/0/O/A-755H-08W8C.jpg")
            
Item.create(title: "Bowhead Whale hunting license",
            travesty_id: travesty_2.id,
            description: "Enough fat to light 10 million candles",
            price: 10000,
            image_url: "http://cdn2.arkive.org/media/8F/8F0FEDA2-4DBE-402D-85B4-B271736355AE/Presentation.Large/Bowhead-whale-caught-by-Inuit-subsistence-whalers.jpg")
