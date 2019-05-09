class RelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:followed_id])
    current_user.follow(other_user)
    
    unless request.path_info == users_url
      redirect_to users_url
    else
      redirect_to other_user
    end
  end

  def destroy
    relationship = Relationship.find(params[:id])
    other_user = User.find(relationship.followed_id)
    relationship.destroy
   
    unless request.path_info == users_url
      redirect_to users_url
    else
      redirect_to other_user
    end
  end
    
end
