class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @users = User.where.not(id: current_user.id).paginate(page: params[:page], per_page: 12)
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities.order(created_at: :desc).paginate(page: params[:page], per_page: 7)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to current_user
    else
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    ids = @user.active_relationships.pluck(:followed_id)
    @users = User.where(id: ids).paginate(page: params[:page], per_page: 12)
  end
  
  def followers
    @user = User.find(params[:id])
    ids = @user.passive_relationships.pluck(:follower_id)
    @users = User.where(id: ids).paginate(page: params[:page], per_page: 12)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
  end
end
