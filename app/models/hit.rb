class Hit
  include Mongoid::Document
  include Mongoid::Timestamps

  field   :url
  field   :ip
  field   :referrer
  field   :browser

  validates_presence_of :url, :ip, :browser
end
