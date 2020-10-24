class ApplicationController < ActionController::Base

    #before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_phone])
    end

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_path, alert: exception.message
    end

#    require 'socket'

#    s = TCPSocket.new '0.0.0.0', 10001

#    while line = s.gets # Read lines from socket
#        puts line         # and print them
#    end

#    s.close 
end
