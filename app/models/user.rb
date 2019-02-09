class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence:true, length: { maximum:50 }
  validates :sex, presence: {message: 'にチェックしてください'}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :birthday, presence: true
  validates :accepted, presence: {message: 'にチェックしてください'}
  validates :password, length: { minimum:6, maximum:12 }
  has_secure_password
 
  has_one_attached :image
  
  has_one_attached :resume_file
  validate :correct_resume_file_mime_type
  
  has_one_attached :career_file
  validate :correct_career_file_mime_type

  def self.search(search)
    return User.all unless search
    User.where(['name LIKE ?', "%#{search}%"])
  end
  
  private

  def correct_resume_file_mime_type
    if resume_file.attached? && !resume_file.content_type.in?(%w(application/pdf))
      errors.add(:resume_file, 'PDFファイルをアップデートして下さい')
    end
  end
  
  def correct_career_file_mime_type
    if career_file.attached? && !career_file.content_type.in?(%w(application/pdf))
      errors.add(:career_file, 'PDFファイルをアップデートして下さい')
    end
  end

end