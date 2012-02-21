class Panel::DeletedCategoriesController < Panel::ApplicationController
  def index
    @categories = Category.deleted.all
  end

  def destroy
    a = Category.deleted.find(params[:id])
    a.delete!

    redirect_to panel_deleted_categories_path,:notice => "Destroy #{a.name} successfully"
  end

  def restore
    a = Category.deleted.find(params[:id])
    a.restore

    redirect_to panel_categories_path,:notice => "Restore #{a.name} successfully"
  end
end
