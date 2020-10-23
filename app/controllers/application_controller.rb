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

    require 'socket'

    server = TCPServer.new 10001 # Server bound to port 2000

    loop do
        client = server.accept    # Wait for a client to connect
        client.puts "Hello !"
        client.puts "Time is #{Time.now}"
        client.close
    end
end
