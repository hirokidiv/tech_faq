class Articles::PostController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      @errors = "こちらは必須事項です！"
      render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require("article").permit(:title, :solution, :factor, :knowledge, :tag_list).merge(user_id: current_user.id)
  end

end
