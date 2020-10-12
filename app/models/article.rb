class Article < ApplicationRecord
  validates_presence_of :title, :lead, :category, :content
  enum category: [:news, :sports, :politics]

  has_one_attached :image
end
