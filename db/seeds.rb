User.create(first_name: "Mr",
            last_name: "Admin",
            username: "admin",
            password: "password",
            role: 1)

travesty = Travesty.create(title: "Environmental Disaster",
                           sponsor_image: "bp.jpg",
                           sponsor_title: "BP")

travesty.items.create(title: "Oil Spill",
                      description: "Our proud sponsor BP would be delighted to spill 5,000 gallons of the sweetest crude large oil rigs can pull from the depths of the Earth",
                      price: 1000,
                      image_url: "oil_barrel.jpg")
travesty.items.create(title: "6 Pack Plastic Rings Ocean Dump",
                      description: "Great for hugging animals! 1,000 uncut beer can holders will be liberated into the Pacific Ocean Gyre",
                      price: 1500,
                      image_url: "turtle_ocean.jpg")
travesty.items.create(title: "Hair-Dryer Ice Cap Melting Team",
                      description: "Oceanic salinity content too high? Sea level too low? A team of revlon-wielding ice-haters will happily go to town on the ice caps for you",
                      price: 2750,
                      image_url: "polar_icecap.jpg")
travesty.items.create(title: "Chemical Plant Arson",
                      description: "Did you find the Runxing Chemical Co. explosion video worth watching repeatedly? Recreate the experience with our experienced arson team!",
                      price: 3500,
                      image_url: "chemical_explosion.jpg")
travesty.items.create(title: "Oceanic Deoxygenation",
                      description: "Algae blooms are like grass plains of the sea!",
                      price: 4250,
                      image_url: "baltic_bloom.jpg")
travesty.items.create(title: "Coal Ash Liberation Event",
                      description: "If your nearby countryside is too colorful and splendid, we can cover it all in a thick coating of ash, filled wiith delightful mercury and lead. The kid's will love it",
                      price: 6800,
                      image_url: "coal_ash_spill.jpg")

travesty_2 = Travesty.create(title: "Endangered Species Culling", sponsor_image: "cecil_killer.jpg", sponsor_title: "Walter Palmer")

travesty_2.items.create(title: "Black Rhino Elimination Privilege",
                        description: "Feel free to take down a friendly rhino! Mother not included.",
                        price: 20000,
                        image_url: "rhino_black.jpg")
travesty_2.items.create(title: "Amur Leopard Reduction Authorization",
                        description: "These pesky kitties are so close to extinction, you might as well push their numbers over the edge",
                        price: 30000,
                        image_url: "amur_leopard.jpg")
travesty_2.items.create(title: "Bowhead Whale Minimization Opportunity",
                        description: "Enough fat can be harvested to light 10 million candles for years on end",
                        price: 22500,
                        image_url: "whale_hunting.jpg")
travesty_2.items.create(title: "Cross River Gorilla Thinning Prerogative",
                        description: "There's only space enough on this planet for one big Ape. Do your part to ensure our species' success",
                        price: 27500,
                        image_url: "gorilla.jpg")
travesty_2.items.create(title: "Hawksbill Turtle Eradication Entitlement",
                        description: "Tired of cleaning up turtle egg-shell litter from your nearest beach? Solve the problem before it starts!",
                        price: 15000,
                        image_url: "turtle_ocean.jpg")
travesty_2.items.create(title: "St. John's River Manatee Extermination Charter",
                        description: "Maybe Sea Cows are as tasty as real cows! Try one today!",
                        price: 10000,
                        image_url: "manatee.jpg")
