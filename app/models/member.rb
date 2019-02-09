class Member < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum:50 }
  validates :sex, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum:6, maximum:12 }
  has_secure_password    

  belongs_to :company
end
