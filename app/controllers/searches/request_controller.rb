class Searches::RequestController < ApplicationController
  def index
    @articles = Article.all
  end
end
