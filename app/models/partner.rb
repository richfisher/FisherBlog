class Partner
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :url, :type => String

  default_scope order_by([:created_at, :asc])
end
