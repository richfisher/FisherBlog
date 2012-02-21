class TagCell < Cell::Rails

  def sidebar
    as = Article.all
    @tags = as.map { |a| a.tags }.flatten.sorted_word_count.slice(0,15)

    sum = @tags.inject(0) {|sum, n| sum + n[1] }

    @tags.map!{|t| [t[0],((t[1]/sum.to_f)*100).round]}
    render
  end

end
