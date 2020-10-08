class ShowArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :lead, :content
end
