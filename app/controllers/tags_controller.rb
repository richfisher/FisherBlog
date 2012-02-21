class TagsController < ApplicationController
  def index
    as = Article.all
    @tags = as.map { |a| a.tags }.flatten.sorted_word_count
  end

  def show
    pattern = Regexp.new(params[:id],Regexp::IGNORECASE)
    @articles = Article.all_in(tags: [ pattern ])
  end
end
