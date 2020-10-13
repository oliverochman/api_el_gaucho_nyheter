class Api::V1::Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_journalist?

  def create
    article = current_user.articles.create(article_params)

    if article.persisted?
      render json: { message: "Article successfully created" }
    else
      error_message(article.errors)
    end
  end

  private

  def article_params
    params.permit(:title, :lead, :content, :category)
  end

  def user_journalist?
    unless current_user.role == "journalist"
      unauthorized
    end
  end

  def unauthorized
    render json: { message: "You don't have permission to perform this action" }, status: 401
  end
end
