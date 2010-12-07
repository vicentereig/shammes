class HitControllerController < ApplicationController
  def list
    @hits = Hit.ascending(:created_at)
  end

  def push
  end

end
