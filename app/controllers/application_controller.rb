class ApplicationController < ActionController::Base

  include ApplicationHelper
  protect_from_forgery

  def index

    mobile_device?

    @girls = Girl.order(:id)
    @rooms = Room.order(:id)
  end

  def mobile_device?
    if mobile_browser? request.user_agent
      request.format = :mobile
    end
  end
end
