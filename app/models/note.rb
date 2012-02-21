class Note
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, :type => String

  default_scope order_by([:created_at, :desc])

  before_save :remove_the_first_blank_p_of_content


  private
  def remove_the_first_blank_p_of_content
    tmp = self.content.gsub(/^<p>\s*&nbsp;<\/p>/,'')
  end
end
