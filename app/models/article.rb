class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include Mongoid::Versioning
  include Mongoid::Paranoia
  max_versions 3

  field :title, :type => String, versioned: true
  field :content, :type => String, versioned: true
  field :tags, type: Array, default: [], versioned: true

  default_scope order_by([:created_at, :desc])

  belongs_to :category

  class << self
    def search(pattern)
      reg = Regexp.new(pattern,Regexp::IGNORECASE)
      any_of({ title: reg },{tags: reg}).all
    end
  end

  def next_article
    Article.where(:created_at.lt=>self.created_at).order_by([:created_at, :desc]).first
  end

  def prev_article
    Article.where(:created_at.gt=>self.created_at).order_by([:created_at, :asc]).first
  end

  def tag_list=(list)
    self.tags = list.split(',').map{|t| t.strip}
  end

  def tag_list
    self.tags.join(',')
  end

end


class Array
  def word_count
    frequencies=Hash.new(0)
    each do |word|
      frequencies[word.capitalize]+=1
    end
    return frequencies
  end

  def sorted_word_count
    word_count.sort{|a,b| b[1]<=>a[1]}
  end
end