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
      day = Date.UTC(this.created_at.getFullYear(), this.created_at.getMonth(), this.created_at.getDate())
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
    Hit.collection.map_reduce(map, reduce, :out => 'daily_pageviews')
  end
end
