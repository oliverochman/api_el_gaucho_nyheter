class Api::V1::Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  # before_action :user_journalist?

  def create
    article = current_user.articles.create(article_params)

    if article.persisted?
      render json: { message: "Article successfully created" }
    else
        render
    end
  end

  private

  def article_params
    params.permit(:title, :lead, :content, :category)
  end
end
