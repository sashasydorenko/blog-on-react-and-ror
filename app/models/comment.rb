class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true

  validates :author, :content, :post, presence: true

  scope :for_post, ->(post_id) { where(post_id: post_id).order(:created_at) }

  def author=(str)
    arr = str.split(' ').map(&:capitalize)
    self[:author] = [arr[0], arr[1]].compact.join(' ')
  end
end
