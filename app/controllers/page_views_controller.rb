class PageViewsController < ApplicationController
  def index
    Hit.pageviews # fires the map reduce on hits collection and fills the page_views one
    @page_views = PageView.all
    render :json => @page_views
  end
end
