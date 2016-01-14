require 'rails_helper'

RSpec.feature "visitor can update quantity of items in cart" do
  scenario "they can add to quantity of item in cart" do
    db_repo = FactoryJordan.new
    db_repo.create_all
    item_1 = db_repo.items[0][0]

    visit '/items'
    first(:button, 'Add to cart').click

  	visit '/cart'

  	within "td#item_#{item_1.id}_qty" do
      expect(find_field('Quantity').value).to eq '1'
    end
  	within "td#item_#{item_1.id}_line_ttl" do
      expect(page).to have_content("100")
    end
  	expect(page).to have_content("100")

  	fill_in "Quantity", with: "3"
    click_button("Update quantity")

  	expect(current_path).to eq('/cart')
  	within "td#item_#{item_1.id}_qty" do
      expect(find_field('Quantity').value).to eq '3'
    end
  	within "td#item_#{item_1.id}_line_ttl" do
      expect(page).to have_content("300")
    end
    expect(page).to have_content("Total Price: $300.00")

  	fill_in "Quantity", with: "2"
    click_button("Update quantity")

  	expect(current_path).to eq('/cart')
  	within "td#item_#{item_1.id}_qty" do
      expect(find_field('Quantity').value).to eq '2'
    end
  	within "td#item_#{item_1.id}_line_ttl" do
      expect(page).to have_content("200")
    end
    expect(page).to have_content("Total Price: $200.00")
  end
end