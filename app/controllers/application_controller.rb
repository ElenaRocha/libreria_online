class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_paper_trail_whodunnit

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end
end
