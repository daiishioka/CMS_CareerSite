class Company < ApplicationRecord
  validates :name, presence:true, length: { maximum:50 }
  validate :correct_image_mime_type
  
  has_one_attached :image
  has_many :recruits, dependent: :destroy
  has_many :members, dependent: :destroy
  
  def self.search(search)
    return Company.all unless search
    Company.where(['name LIKE ?', "%#{search}%"])
  end
  
  private
  
  def correct_image_mime_type
    if image.attached? && !image.content_type.in?(%w(image/jpg image/jpeg image/png))
      errors.add(:image, 'を入れて下さい')
    end
  end
end
