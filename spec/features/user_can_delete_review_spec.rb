require 'rails_helper'

RSpec.feature "User can delete their own reviews" do
  scenario "User is redirected back to their dashboard upon deleting their review" do
    travesty = create(:travesty)
    item = travesty.items.create(title: "Black Rhino",
                                description: "kill em all",
                                price: 10)
    user = User.create(first_name: "Greg",
                       last_name: "Armstrong",
                       password: "password",
                       username: "greg",
                       role: 0)
    review = Review.create(text: "Test Review")
    item.reviews << review
    user.reviews << review

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Sign In"

    expect(page).to have_content(review.text)

    click_on "Delete Review"

    expect(page).to_not have_content(review.text)
  end
end
