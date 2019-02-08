class Company < ApplicationRecord
  validates :name, presence:true, length: { maximum:50 }

  has_one_attached :image
  
  has_many :recruits, dependent: :destroy
  has_many :members, dependent: :destroy
  
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      return all
    end
  end
  
end
