class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence:true, length: { maximum:50 }
  validates :sex, presence: {message: 'にチェックしてください'}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :birthday, presence: true
  validates :accepted, presence: {message: 'にチェックしてください'}
  validates :password, length: { minimum:6, maximum:12 }
  has_secure_password
 
  has_one_attached :image
  
  def self.search(search)
    return User.all unless search
    User.where(['name LIKE ?', "%#{search}%"])
  end
end