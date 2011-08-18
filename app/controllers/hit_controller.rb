class HitController < ApplicationController
  def list
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

end
