class Hit
  include Mongoid::Document
  include Mongoid::Timestamps

  field   :url
  field   :ip
  field   :referrer
  field   :browser

  index   :created_at

  validates_presence_of :url, :ip, :browser
end
