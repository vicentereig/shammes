class Hit
  include Mongoid::Document
  include Mongoid::Timestamps

  field   :url
  field   :ip
  field   :referer

  validates_presence_of :url, :referer, :page
end
