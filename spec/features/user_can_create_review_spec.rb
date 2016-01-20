require 'rails_helper'

RSpec.feature "User can create a review for an item" do
  scenario "User is taken back to item after creating a review for it" do
    travesty = create(:travesty)
    item = travesty.items.create(title: "Black Rhino", description: "kill em all", price: 10)
    user = User.create(first_name: "Greg", last_name: "Armstrong", password: "password", username: "greg", role: 0)
    text = "Test Review"

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit item_path(item)

    click_on "Add Review"

    expect(current_path).to eq new_item_review_path(item)
    fill_in "Text", with: text
    click_on "Create Review"

    save_and_open_page

    expect(page).to have_content(user.username)
    expect(page).to have_content(text)
  end
end
