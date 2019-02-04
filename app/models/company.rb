class Company < ApplicationRecord
  has_one_attached :image
  
  has_many :recruits
end
