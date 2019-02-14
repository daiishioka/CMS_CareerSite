class Prefecture < ApplicationRecord
  has_many :user_prefecture_relations, dependent: :destroy
  has_many :users, through: :user_prefecture_relations
end
