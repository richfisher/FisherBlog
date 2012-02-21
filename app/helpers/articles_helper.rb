#encoding: utf-8
module ArticlesHelper
  def highlight_tags_and_contents(article,search_word)
    pattern = Regexp.new(search_word,Regexp::IGNORECASE)
    string = Array.new
    if article.tag_list.match(pattern)
      list = article.tag_list.gsub(pattern) {|m| '<span class="highlight">'+m+'</span>'}
      string << "[Tags: #{list}]"
    end
    string << "内容包含#{search_word}" if article.content.include?(search_word)
    raw string.join(',')
  end

  def link_to_title_with_highlight(article,pattern)
    link_to article_path(article) do
      raw article.title.gsub(/#{pattern}/i) {|m| '<span class="highlight">'+m+'</span>'}
    end
  end

  def show_tags_link(tags)
    if tags.size > 5
      tags = tags.slice(0,5)
      raw tags.map{|tag| link_to tag,tag_path(tag)}.join(',') + ',...'
    else
      raw tags.map{|tag| link_to tag,tag_path(tag)}.join(',')
    end
  end

  def show_prev_article_link(article)
    a=article.prev_article
    if a
      link_to '<',article_path(a)
    end
  end

  def show_next_article_link(article)
    a=article.next_article
    if a
      link_to '>',article_path(a)
    end
  end

  def show_category_name(category)
    category.name if category.present?
  end

  def show_category_link(category)
    link_to category.name,category_path(category) if category.present?
  end

  def truncated_article_content(article,output_length=1200)
    sub_content = article.content[0..output_length]
    sub_content.sub!(/<[^>]+$/,'') #去除最后不完整的标签

    open_tags = sub_content.scan(/<([^\/>]+)>/).map{|e| e.first.split(' ').first}
    close_tags = sub_content.scan(/<\/([^>]+)>/).map{|e| e.first}

    remaining_open_tags = get_remaining_tags(open_tags,close_tags)
    addition_close_tags = remaining_open_tags.map{|e| "</#{e}>"}.reverse.join(' ') #补上close tag

    omission= link_to '..............继续阅读..............',article_path(article) if article.content.size > output_length
    omission_div = content_tag(:div,omission,:class=>'omission')

    raw sub_content + addition_close_tags + omission_div.to_s
  end

  private
  def get_remaining_tags(open_tags,close_tags)
    open_tags.each_with_index do |val1,index1|
      close_tags.each_with_index do |val2,index2|
        if val1 == val2
          open_tags[index1] = nil
          close_tags[index2] = nil
          break
        end
      end
    end

    open_tags.compact
  end
end
