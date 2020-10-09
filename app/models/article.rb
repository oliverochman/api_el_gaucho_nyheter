class Article < ApplicationRecord
  validates_presence_of :title, :lead, :category
  enum category: [:news, :sports, :category ] 
end
