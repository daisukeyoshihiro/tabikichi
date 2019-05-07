class User < ApplicationRecord
    validates :name, presence: true, length: {minimum:2, maximum:30}
    validates :email, presence: true, uniqueness: true
    has_secure_password
    validates :password, length: { minimum:6 }
        allow_nil: true
    mount_uploader :picture, PictureUploader
end