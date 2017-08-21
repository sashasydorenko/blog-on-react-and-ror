class CommentSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :author, :content, :created_at

  def created_at
    time_ago_in_words(object.created_at) if object.created_at
  end
end
