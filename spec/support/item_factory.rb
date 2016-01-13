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
    ["http://www.commodityonline.com/images/20548329231406548227.jpg",
     "http://www.pakitproducts.com/GetImage.ashx?Path=~%2FAssets%2Fperforated_rings8.jpg&maintainAspectRatio=true&maxHeight=400&maxWidth=400",
     "http://media.treehugger.com/assets/images/2011/10/pacific-garbage-patch.jpg",
     "http://cdn2-b.examiner.com/sites/default/files/styles/image_content_width/hash/d5/42/d54226cc953531480326a45b66672fdf.jpg?itok=GvTz81SK",
     "https://40.media.tumblr.com/e70e267450adf42a0b8306d54810d764/tumblr_moswzrBtAB1qk91wgo1_1280.jpg",
     "http://www.nunatsiaqonline.ca/pub/photos/bowhead.JPG",
     "http://www.animaroo.com/assets/sites/animaroo.com/img/breeds/img/timber-wolf_medium.jpg?1355978537",
     "https://upload.wikimedia.org/wikipedia/commons/6/66/Polar_Bear_-_Alaska_(cropped).jpg"]
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
