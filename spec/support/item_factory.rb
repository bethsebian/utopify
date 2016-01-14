class ItemFactory

  def self.create_items(travesty)
    items = item_titles.map.with_index do |item, index|
       Item.create(item_params(index, travesty.id)) if (travesty_correspondant[index] == travesty.title)
    end
    items.compact
  end

  def self.item_params(index, travesty_id)
    item_params = {title: item_titles[index],
                   description: item_desciptions[index],
                   price: item_prices[index],
                   image_url: item_urls[index],
                   travesty_id: travesty_id}
  end

  def self.item_titles
    ["Oil Barrel Dump",
     "6 Pack Holster Dump",
     "Add to Great Pacific Plastic Island",
     "Contaminate Water Supply",
     "Black Rhino",
     "Bowhead Whale",
     "Timber Wolf",
     "Polar Bears"]
  end

  def self.item_desciptions
    ["A little dirt never hurt anybody",
     "The fun shouldnt end when your beers do.",
     "Out of sight, out of mind.",
     "What doesnt kill em makes em stronger!",
     "Would look great hung up next to your Donald Trump shrine!",
     "You know the saying: If you cant picture what it looks like, it must not be important",
     "As over-rated an animal as an NBA team",
     "Because they're dicks."]
  end

  def self.item_prices
    [100, 300, 750, 1250, 123, 4523, 543, 8765]
  end

  def self.item_urls
    ["app/assets/images/oil_barrel.jpg",
      "app/assets/images/turtle_ocean.jpg",
      "app/assets/images/trash_island.jpg",
      "app/assets/images/water_contamination.jpg",
      "app/assets/images/rhino_black.jpg",
      "app/assets/images/whale_hunting.jpg",
      "app/assets/images/timber_wolves.jpg",
      "app/assets/images/polar_bear.jpg"]
    end

  def self.travesty_correspondant
    ["Environmental Disasters",
     "Environmental Disasters",
     "Environmental Disasters",
     "Environmental Disasters",
     "Endangered Animal Culling",
     "Endangered Animal Culling",
     "Endangered Animal Culling",
     "Endangered Animal Culling"]
   end

  end
