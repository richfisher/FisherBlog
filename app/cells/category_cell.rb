class CategoryCell < Cell::Rails

  def sidebar
    @categories = Category.all.sort_by{|c| c.articles.size}.reverse
    render
  end

end
