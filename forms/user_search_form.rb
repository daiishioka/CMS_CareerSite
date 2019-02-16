class CustomerSearchForm
  include ActiveModel::Model
 
  attr_accessor  :tag_id, :prefecture_id, :sex, :selfpr, :academic_background, :certification
 
  def search
    rel = User
    rel = rel.where('sex LIKE ? OR selfpr LIKE ? OR academic_background LIKE ? OR certification LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    rel = rel.joins(:prefecture).where("prefecture.id = ?", prefecture_id) if prefecture_id.present?
    rel = rel.joins(:tag).where("tag,id = ?", tag_id) if tag_id.present?
    rel
  end
end