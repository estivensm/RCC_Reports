class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

layout :layout_for_selection
protected
  def layout_for_selection
    if controller_name == 'sessions'  || controller_name == 'passwords' 
      'home'
    elsif controller_name == 'registrations'

        if action_name == "new" || action_name == "create"
            'home'
            else
            	'application'
        end
    	else
      'application'
    end
  end
end
