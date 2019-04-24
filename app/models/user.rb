class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum:50 }
  validates :sex, presence: {message: 'にチェックしてください'}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :birthday, presence: true
  validates :password, length: { minimum:6, maximum:12 }
  validate :correct_image_mime_type
  validate :correct_resume_file_mime_type
  validate :correct_career_file_mime_type
  validates :accepted, presence: {message: 'にチェックしてください'}
  
  has_many :user_tag_relations, dependent: :destroy
  has_many :tag, through: :user_tag_relations
  
  belongs_to :prefecture, optional: true
      
  has_secure_password
  has_one_attached :image
  has_one_attached :resume_file
  has_one_attached :career_file

  def self.search(keyword)
    if keyword && keyword != ""
      words = keyword.to_s.split(" ")
      columns = ["selfpr", "academic_background", "certification"]
      query = []
      result = []
 
      columns.each do |column|
        query << ["#{column} LIKE ?"]
      end
 
      words.each_with_index do |w, index|
        if index == 0
          result[index] = User.where([query.join(" OR "), "%#{w}%", "%#{w}%", "%#{w}%"])
        else
          result[index] = result[index-1].where([query.join(" OR "), "%#{w}%", "%#{w}%", "%#{w}%"])
        end
      end
      return result[words.length-1]
    else
      User.all
    end
  end
  
  def age()
    now = Time.zone.now
    date_format = "%Y%m%d"
    (now.strftime(date_format).to_i - self.birthday.strftime(date_format).to_i) / 10000
  end
  
  private
  def correct_image_mime_type
    if image.attached? && !image.content_type.in?(%w(image/jpg image/jpeg image/png))
      errors.add(:image, 'を入れて下さい')
    end
  end

  def correct_resume_file_mime_type
    if resume_file.attached? && !resume_file.content_type.in?(%w(application/pdf))
      errors.add(:resume_file, 'を入れて下さい')
    end
  end
  
  def correct_career_file_mime_type
    if career_file.attached? && !career_file.content_type.in?(%w(application/pdf))
      errors.add(:career_file, 'を入れて下さい')
    end
  end
end