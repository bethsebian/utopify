FactoryGirl.define do

  factory :item do
    title
    description
    price
    image_url "rhino_black.jpg"
  end

  sequence :title do |n|
    "#{n} Item"
  end

  sequence :description do |n|
    "#{n} Description"
  end

  sequence :price do |n|
    n * 1000
  end

  travesty_titles = ["Environmental 'Enhancements'",
                     "Endangered Species Culling",
                     "Political 'Pursuasion'",
                     "Big Pharm Phun",
                     "Crowd Funded, Prisoner Approved"]

  sequence :travesty_title, travesty_titles.cycle do |n|
    "#{n}"
  end

  factory :travesty do
    title { generate(:travesty_title) }

    factory :travesty_with_items do
      items { create_list(:item, 4) }
    end
  end
end
