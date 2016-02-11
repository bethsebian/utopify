class PlatformAdminController < ApplicationController
	before_action :confirm_platform_admin

	def confirm_platform_admin
		redirect_to '/404' unless current_user.platform_admin?
	end
end
