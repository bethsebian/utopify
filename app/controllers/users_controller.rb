class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(set_user)
    if @user.save
      session[:user_id] = [@user.id]
      redirect_to dashboard_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:format])
  end

  private

  def set_user
    params.require(:user).permit(:name,
                                 :username,
                                 :password,
                                 :password_confirmation)
  end

end
