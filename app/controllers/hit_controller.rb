class HitController < ApplicationController
  def index
    @hits = Hit.desc(:created_at).page params[:page]
  end

  def push
    if params[:hit]
      params[:hit].merge!(:ip => request.remote_ip, :browser => request.headers["User-Agent"])
      h = Hit.new(params[:hit])
      h.save!
    end

    send_data(
        File.open(File.join(Rails.root, "/public/images/magic_star.png"), 'rb'){ |io| io.read },
        :type => "image/png",
        :size => File.size(File.join(Rails.root, "/public/images/magic_star.png")),
        :filename => "magic_star.png",
        :disposition => 'inline'
      )
  end
  # WIP
  def self.pageviews
    map = <<JS
    function() {
      day = (24 * 60 * 60) % this.created_at;
      emit({day: day}, {count: 1});
    }
JS
    reduce = <<JS
    function (key, values) {
      var count = 0;
      values.forEach(function(v){
        count += v['count'];
      });
      return {count: count};
    }
JS
  end

end
