class Hit
  include Mongoid::Document
  include Mongoid::Timestamps
  paginates_per 50

  field   :url
  field   :ip
  field   :referrer
  field   :browser

  index   :created_at

  validates_presence_of :url, :ip, :browser


  # WIP
  def self.pageviews
    map = <<JavaScript
    function() {
      day = (24 * 60 * 60) % this.created_at;
      emit({day: day}, {count: 1});
    }
JavaScript
    reduce = <<JavaScript
    function (key, values) {
      var count = 0;
      values.forEach(function(v){
        count += v['count'];
      });
      return {count: count};
    }
JavaScript
  end
end
