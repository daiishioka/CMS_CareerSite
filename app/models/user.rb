class User < ApplicationRecord
  has_one_attached :image
  validate :image_type
  
  def thumbnail input
    return self.image[input].variant(resize: '100x100!').processed
  end
  
  private
  
  def image_type
    if !image.content_type.in?(%('image/jpec image/png'))
      errors.add(:images, 'needs to be a JPEG or PNG')
    end
  end
end