class PermissionService
  extend Forwardable

  attr_reader :user, :controller, :action

  def_delegators :user, :platform_admin?, :store_admin?, :registered_user?

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when user.platform_admin? then platform_admin_permissions
    when user.store_admin? then store_admin_permissions
    else
      global_admin_permissions
    end
  end

  private

  def platform_admin_permissions
    return true if controller == "home" && action.in?(%w(index))
    return true if controller == "cart_items" && action.in?(%w(show create destroy update))
    return true if controller == "platform_admin/dashboard" && action.in?(%w(show index)) # confirm show is needed
    return true if controller == "platform_admin/items" && action.in?(%w(new create))
    return true if controller == "categories" && action.in?(%w(index show edit update))
    return true if controller == "dashboard" && action.in?(%w(index))
    return true if controller == "items" && action.in?(%w(index show new create edit update))
    return true if controller == "orders" && action.in?(%w(index create show update))
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "stores" && action.in?(%w(show new create update))
    return true if controller == "users" && action.in?(%w(new create show edit update))
  end

  def store_admin_permissions
    return true if controller == "home" && action.in?(%w(index))
    return true if controller == "cart_items" && action.in?(%w(show create destroy update))
    return true if controller == "categories" && action.in?(%w(index show))
    return true if controller == "dashboard" && action.in?(%w(index))
    return true if controller == "items" && action.in?(%w(index show new create edit update destroy))
    return true if controller == "orders" && action.in?(%w(index create show update))
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "stores" && action.in?(%w(show new create edit update))
    return true if controller == "users" && action.in?(%w(new create show edit update))
  end

  def global_admin_permissions
    return true if controller == "home" && action.in?(%w(index))
    return true if controller == "cart_items" && action.in?(%w(show create destroy update))
    return true if controller == "categories" && action.in?(%w(index show))
    return true if controller == "items" && action.in?(%w(index show))
    return true if controller == "orders" && action.in?(%w(index create show))
    return true if controller == "sessions" && action.in?(%w(new create destroy))
    return true if controller == "stores" && action.in?(%w(show new create))
    return true if controller == "users" && action.in?(%w(new create show edit update))
  end
end
