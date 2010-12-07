class HitController < ApplicationController
  def list
    @hits = Hit.ascending(:created_at)
  end

  def push
    params.merge(:ip => request.remote_ip, :referer => request.headers["Referer"], :browser => request.headers["User-Agent"])
    h = Hit.new(params[:hit])
    h.save!
    render :text => "Magic text."
  end

end
