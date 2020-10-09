class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles, each_serializer: ArticlesIndexSerializer
  end

  def show
    begin
      article = Article.find(params[:id])
      render json: article, serializer: ShowArticleSerializer
      
    rescue => error
      render json: { error: 'Article does not exist' }, status: :not_found
    end
  end
end
