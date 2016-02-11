require 'rails_helper'

RSpec.describe Store, type: :model do
	it "is created with default status of 'pending'" do
		store = Store.create(
			title: "Store",
			description: "Description",
			image_url: "http://www.image_url.com",
			accreditations: "['The Nature Conservancy']"
		)

		expect(store.status).to eq "pending"
	end
end
