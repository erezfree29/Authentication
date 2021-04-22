class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery prepend: true
end

module SiteHelper
  def post_user_email(user)
    current_user.id
  end
end