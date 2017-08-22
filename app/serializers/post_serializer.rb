class PostSerializer < ActiveModel::Serializer
  include DateTimeHelper

  attributes :id, :name, :content, :comments_count, :category, :category_id, :file, :created_at

  def content
    object.content.truncate(400)
  end

  def category
    object.category&.name
  end

  def file
    object.file.thumb.url
  end

  def created_at
    date_long(object.created_at)
  end
end
