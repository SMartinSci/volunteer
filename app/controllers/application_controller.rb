require 'rack-flash'
require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "volunteer_app"
  end

  get '/' do
    if logged_in?
      @user = User.find(session[:user_id])
    end
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 
  end
end
