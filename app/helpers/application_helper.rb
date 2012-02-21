module ApplicationHelper
  def set_page_title(page_title)
    if page_title.to_s.size > 0
      content_for :title, page_title.to_s + ' - '
    end
  end

  def format_datetime(datetime)
    datetime.to_date
  end
end
