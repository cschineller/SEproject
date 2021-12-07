class ApplicationController < ActionController::Base
    def is_admin?
        signed_in? ? current_user.admin : false
    end
end
