class UserPrefectureRelation < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
end
