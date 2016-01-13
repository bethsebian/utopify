require_relative 'item_factory.rb'

class TravestyFactory

  def self.create_all
    travesties = []
    items = []
    travesty_titles.each_with_index do |title, index|
      travesty = Travesty.create(travesty_params(index))
      travesties << travesty
      items << ItemFactory.create_items(travesty)
    end
    [travesties, items]
  end

  def self.create_travesty(travesty)
    travesties = []
    items = []
    travesty_titles.each_with_index do |title, index|
      travesty = Travesty.create(travesty_params(index)) if title == travesty.title
      items = ItemFactory.create_items(travesty)
    end
    [travesty, items]
  end

  def self.travesty_titles
    ["Environmental Disasters",
     "Endangered Animal Culling"]
  end

  def self.travesty_params(index)
    {title: travesty_titles[index]}
  end

end
