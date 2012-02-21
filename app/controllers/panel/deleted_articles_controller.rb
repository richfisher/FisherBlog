class Panel::DeletedArticlesController < Panel::ApplicationController
  def index
    @articles = Article.deleted.all
  end

  def show
    @article = Article.deleted.find(params[:id])
    render 'articles/show'
  end

  def destroy
    a = Article.deleted.find(params[:id])
    a.delete!

    redirect_to panel_deleted_articles_path,:notice => "Destroy #{a.title} successfully"
  end

  def restore
    a = Article.deleted.find(params[:id])
    a.restore

    redirect_to panel_articles_path,:notice => "Restore #{a.title} successfully"
  end
end
