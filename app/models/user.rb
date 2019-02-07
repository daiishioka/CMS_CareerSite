class User < ApplicationRecord
  has_one_attached :image
  has_one_attached :document

  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if document.attached? && !document.content_type.in?(%w(application/msword application/pdf))
      errors.add(:document, 'Must be a PDF or a DOC file')
    end
  end

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      return all
    end
  end
end