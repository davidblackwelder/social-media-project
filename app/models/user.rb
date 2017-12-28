class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #User has many tweets and when a User is destroyed the associated tweets get destroyed also
  has_many :tweets, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader
  
end
