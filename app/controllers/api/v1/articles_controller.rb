class Api::V1::ArticlesController < ApplicationController
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

  before_action :authenticate_user!
  before_action :user_journalist?

  def create
    article = current_user.articles.create(article_params)

    if article.persisted?
      render json: { message: "Articles successfully created" }
    else
    end
  end

  private

  def article_params
    params.permit(:title, :lead, :content, :category)
  end
end
