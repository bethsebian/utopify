require 'rails_helper'

RSpec.feature "store admin vists wrong store dash" do
	scenario "and is redirected to the home page" do

    store_admin_1 = create(:user, role: 1)
    store_1 = create(:store, user_id: store_admin_1.id)

    store_admin_2 = create(:user, role: 1)
    store_2 = create(:store, user_id: store_admin_2.id)

    ApplicationController.any_instance.stub(:current_user).and_return(store_admin_1)

    visit store_dashboard_index_path(store_1.slug)

    expect(page).to have_content(store_1.title)

    visit store_dashboard_index_path(store_2.slug)
    
    expect(current_path).to eq('/404')
    expect(page).to have_content("doesn't exist")

  end
end
