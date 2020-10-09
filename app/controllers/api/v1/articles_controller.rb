class Api::V1::ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_active_record_error

  def index 
      if params[:category]
        articles = Article.where(category: params['category'])
        
      else 
        articles = Article.all
      end
    if articles != []
      render json: articles, each_serializer: ArticlesIndexSerializer
    else
      render json: { error: 'Article does not exist' }, status: :not_found
    end
  end

  def show
    begin
      article = Article.find(params[:id])
      render json: article, serializer: ShowArticleSerializer
    rescue => error
      render json: { error: 'Article does not exist' }, status: :not_found
    end
  end

  private

  def render_active_record_error
    render json: { error_message: 'Sorry we can not find that article' }, status: 404
  end
end
