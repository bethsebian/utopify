class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_cart, :current_user, :authorize!
  # helper_method :current_user, :store_admin?, :platform_admin?, :category_arr, :store_permissions, :category_arr, :current_store

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def current_admin?
  #   current_user && current_user.admin?
  # end

  # def current_store
  #   if platform_admin?
  #     Store.find_by(slug: params[:store])
  #   else
  #     current_user.store
  #   end
  # end

  def require_current_user
    render file: "/public/404" unless current_user
  end

  # def store_admin?
  #   current_user && "business_admin".in?(current_user.roles.pluck(:name))
  # end

  def platform_admin?
    current_user && current_user.platform_admin?
  end

  def current_permission #
    @current_permission ||= PermissionService.new(current_user)
  end

  def authorize! # any user accessing any page to root unless authorized
    unless authorized?
      redirect_to root_url
    end
  end

  def authorized? # looks up what they are allowed to do, and checks that against the controller and action they're trying to access
    current_permission.allow?(params[:controller], params[:action])
  end

  # def category_arr
  #   Category.all.map { |cat| [cat.name, cat.id] }
  # end

  # def store_permissions
  #   platform_admin? || current_user && current_user.store_admin? && current_user.store == @store
  # end

end
