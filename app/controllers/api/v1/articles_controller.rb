class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    if params[:category]
      articles = Article.where(category: params[:category])
    else
      articles = Article.all
    end
    render json: articles, each_serializer: ArticlesIndexSerializer
  rescue
    render json: { error: "Sorry, we don't have that category" }, status: :not_found
  end

  def show
    begin
      article = Article.find(params[:id])
      render json: article, serializer: ShowArticleSerializer
    rescue => error
      render json: { error: "Article does not exist" }, status: :not_found
    end
  end

  def create
    article = Article.create(article_params)
    binding.pry
    if article.persisted? && attach_image(article)
      render json: { message: 'Article successfully created!' }, status: :created
    else 
      binding.pry
    end
  end

  private

  def attach_image(article)
    params_image = params[:article][:image]
    if params_image.present?
      DecodeService.attach_image(params_image, article.image)
    end
  end

  def article_params
    params.require(:article).permit(:title, :content, :lead, :category)
  end
end
