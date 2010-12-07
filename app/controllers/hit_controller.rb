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

    send_data(
        File.open File.join(Rails.root, "public/images/magic_star.png").read, 
        :type => "image/png",
        :filename => "mugic_sturr.png",
        :disposition => 'inline'
      )
  end

end
