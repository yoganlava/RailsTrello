class ApplicationController < ActionController::Base
    include Knock::Authenticable
    protect_from_forgery with: :null_session

    def auth_user
        authenticate_for API::user;
    end
end
