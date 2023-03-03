class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :user_image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
 
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.user_name = "guest"
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
end