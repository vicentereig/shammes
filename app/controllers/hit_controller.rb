class HitController < ApplicationController
  def list
    @hits = Hit.ascending(:created_at)
  end

  def push
    Hit.create(:url => request.url, :ip => request.remote_ip, :referer => request.headers["Referer"], :browser => request.headers["User-Agent"])
  end

end
