class Hit
  include Mongoid::Document
  include Mongoid::Timestamps

  field   :url
  field   :ip
  field   :referer
  field   :browser

  validates_presence_of :url, :referer, :page
end
