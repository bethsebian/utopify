
travesty = Travesty.create(title: "Environmental Disaster")
travesty_2 = Travesty.create(title: "Endangered Species Culling")

Item.create(title: "Oil Barrel",
            description: "holds oil",
            price: 10,
            travesty_id: travesty.id,
            image_url: "oil_barrel.jpg")

Item.create(title: "6 Pack Plastic Rings",
            description: "Great for hugging animals!",
            price: 1000,
            travesty_id: travesty.id,
            image_url: "turtle_ocean.jpg")

Item.create(title: "HairDryer Icecap Melting Team",
            description: "Great for fun in the snow/water!",
            price: 10,
            travesty_id: travesty.id,
            image_url: "polar_icecap.jpg")

Item.create(title: "Black Rhino hunting license",
            travesty_id: travesty_2.id,
            description: "Get em while they're here, mother not included.",
            price: 20000,
            image_url: "rhino_black.jpg")

Item.create(title: "Bowhead Whale hunting license",
            travesty_id: travesty_2.id,
            description: "Enough fat to light 10 million candles",
            price: 10000,
            image_url: "whale_hunting.jpg")