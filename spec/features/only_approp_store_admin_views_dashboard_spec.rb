require 'rails_helper'

RSpec.feature "store and store's admin' exist" do
  attr_reader :store_admin_1, :store_admin_2, :store_1, :store_2, :registered_user, :platform_admin

  def setup
    @platform_admin = create(:user, role: 2)

    @store_admin_1 = create(:user, role: 1)
    @store_1 = create(:store, user_id: store_admin_1.id)

    @store_admin_2 = create(:user, role: 1)
    @store_2 = create(:store, user_id: store_admin_2.id)

    @registered_user = create(:user, role: 0)
  end

	scenario "store_admin cannot access other store's dash" do
    setup

    ApplicationController.any_instance.stub(:current_user).and_return(store_admin_1)

    visit store_dashboard_index_path(store_1.slug)

    expect(page).to have_content(store_1.title)

    visit store_dashboard_index_path(store_2.slug)

    expect(current_path).to eq('/404')
    expect(page).to have_content("doesn't exist")
  end

  scenario "user cannot access store dash" do
    setup

    ApplicationController.any_instance.stub(:current_user).and_return(registered_user)

    visit store_dashboard_index_path(store_1.slug)

    expect(current_path).to eq('/404')
    expect(page).to have_content("doesn't exist")
  end

  scenario "platform_admin can view any store's dash" do
    setup

    ApplicationController.any_instance.stub(:current_user).and_return(platform_admin)

    visit store_dashboard_index_path(store_1.slug)

    expect(page).to have_content(store_1.title)

    visit store_dashboard_index_path(store_2.slug)

    expect(page).to have_content(store_2.title)
  end

end
