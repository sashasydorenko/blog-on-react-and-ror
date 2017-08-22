class Post < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :category

  validates :name, :content, presence: true

  def self.search(query)
    if query.blank?
      all
    else
      where('name LIKE ? OR content LIKE ?', "%#{query}%", "%#{query}%")
    end
  end
end
