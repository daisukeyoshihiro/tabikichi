class Admin::UsersController < ApplicationController
  before_action :require_admin
  def update
    @user = User.find(params[:id])
    if @user.update(admin: true)
      redirect_to users_url
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update(admin: false)
      redirect_to users_url
    end
  end

  private

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
