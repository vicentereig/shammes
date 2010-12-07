class HitController < ApplicationController
  def list
    @hits = Hit.ascending(:created_at)
  end

  def push
    if params[:hit]
      params[:hit].merge!(:ip => request.remote_ip, :browser => request.headers["User-Agent"])
      h = Hit.new(params[:hit])
      h.save!
    end

    send_file(
        "public/images/magic_star.png",
        :type => "image/png",
        :filename => "magic_star.png",
        :disposition => 'inline'
      )
  end

end
