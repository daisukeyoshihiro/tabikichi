class User < ApplicationRecord
  validates :name, presence: true, length: {minimum:2, maximum:30}
  validates :email, presence: true, uniqueness: true
  has_secure_password
  validates :password, length: { minimum:6 },
    allow_nil: true
  mount_uploader :picture, PictureUploader

  def follow(other_user)
    Relationship.create(
      follower_id: id,
      followed_id: other_user.id
    )
  end

  def active_relationships
    Relationship.where(follower_id: id)
  end
    
    
  def passive_relationships   
    Relationship.where(followed_id: id)
  end
    
    
  def relationship(other_user)   
    active_relationships.find_by(followed_id: other_user.id)   
  end

end