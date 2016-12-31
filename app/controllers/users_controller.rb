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
    if current_user
      @user = current_user
    else
      flash[:error] = {message: "Must be signed in to see dashboard.", color: "red"}
      redirect_to root_path
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    user.update_attributes(set_user)
    if user.save
      flash[:success] = {message: "Your user info has been updated", color: "white"}
      redirect_to dashboard_path
    else
      flash[:error] = {message: user.errors.full_messages.join(", "), color: "red"}
      redirect_to action: "edit"
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
