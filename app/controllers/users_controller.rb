class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(set_user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:error] = {message: @user.errors.full_messages.join(", "), color: "red"}
      redirect_to new_user_path
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to store_admin_dashboard_path if @user.store_admin?
    else
      flash[:error] = {message: "Must be signed in to see dashboard.", color: "red"}
      redirect_to root_path
    end
  end

  private

  def set_user
    params.require(:user).permit(
      :first_name,
      :last_name,
      :username,
      :password,
      :password_confirmation
    )
  end

end
