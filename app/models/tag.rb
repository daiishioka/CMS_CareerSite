class Tag < ApplicationRecord
  has_many :user_tag_relations, dependent: :destroy
  has_many :users, through: :user_tag_relations
end
