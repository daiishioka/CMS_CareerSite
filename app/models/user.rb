class User < ApplicationRecord
  has_one_attached :image

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      return all
    end
  end
end