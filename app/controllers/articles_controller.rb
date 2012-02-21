class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.page(params[:page]).per(8)

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @article }
      #format.xml { render xml: @article }
    end
  end

  def search
    @pattern = params[:search]
    @articles=Article.search(@pattern)

    render 'search_no_result' if @articles.blank?
  end

end



