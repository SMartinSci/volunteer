class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to '/entries'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:failure] = "You must fill out all fields to sign up."
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      redirect to '/entries'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/entries'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id	
      redirect to '/entries'
    else
      flash[:failure] = "If you aren't signed up, please Sign Up first. 
      If you are signed up and you reached this page, you entered an invalid email address or password. Please try again."
      redirect to '/login'
    end	
  end	  

  get '/users/:id' do
    @user = User.find_by_id(params[:id]) 
    @entries = @user.entries
      erb :'/users/show'
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:success] = "You have been logged out of your account."
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end	