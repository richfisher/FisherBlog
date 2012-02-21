class Category
  include Mongoid::Document
  include Mongoid::Paranoia

  field :name, :type => String

  has_many :articles, order: :created_at.desc

end
