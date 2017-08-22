class Category < ApplicationRecord
  has_many :posts, dependent: :nullify

  validates :name, :description, presence: true
end
