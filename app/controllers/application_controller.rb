require 'user_agent'

Browser = Struct.new(:browser, :version)

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :parse_user_agent
  attr_reader :user_agent
  helper_method :user_agent
  helper_method :ie8

  def ie8
     Browser.new("Internet Explorer", "8.0")
  end

  def user_agent
    @user_agent ||= UserAgent.parse request.user_agent
  end

  protected
  def parse_user_agent
    @user_agent ||= UserAgent.parse request.user_agent
  end
end
