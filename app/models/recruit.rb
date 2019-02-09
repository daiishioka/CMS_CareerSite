class Recruit < ApplicationRecord
  validates :title, presence: true, length: { maximum:25 }
  belongs_to :company
end
