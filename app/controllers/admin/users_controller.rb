class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(admin: true)
      redirect_to admin_users_url
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update(admin: false)
      redirect_to admin_users_url
    end
  end
end
