require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
 register Sinatra::Flash
 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "volunteer_app"
  end

  get '/' do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:failure] = "Sign up or login to access entries."
        redirect '/login'
      end
    end
  end
end
