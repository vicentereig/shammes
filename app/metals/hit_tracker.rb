class HitTracker < ActionController::Metal
  include ActionController::Streaming
  
  def push
    if params[:hit] && request.referer
      params[:hit].merge!(:ip => request.remote_ip, :browser => request.headers["User-Agent"])
      h = Hit.new(params[:hit])
      # TODO: tracked sites must live in the db. Also checking the referer belongs to the model.
      if request.referer.blank? || request.referer.present?  && request.referer =~ /^http:\/\/vicentereig.tumblr.com/
        h.save!
      end
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