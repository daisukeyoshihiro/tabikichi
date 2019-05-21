class DashbordController < ApplicationController
  def index
    @users = current_user.active_relationships.collect{ |n| n.followed_id}
    @activities = Activity.where("user_id IN (?) OR user_id = ?", @users, current_user.id).order(created_at: :desc).paginate(page: params[:page], per_page: 8)
  end
end