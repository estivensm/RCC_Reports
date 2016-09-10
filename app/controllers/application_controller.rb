class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

layout :layout_by_resource
   def layout_by_resource
    if user_signed_in?
      'application'
    else
      'home'
    end
  end
end
