class HitsController < ApplicationController
  def index
    @hits = Hit.desc(:created_at).page params[:page]
  end
end
