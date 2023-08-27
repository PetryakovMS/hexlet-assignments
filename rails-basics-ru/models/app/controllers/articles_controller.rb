class ArticlesController < ApplicationController
  def show
    @article = Article.first
  end

  def index
    @articles = Article.all
  end
end
