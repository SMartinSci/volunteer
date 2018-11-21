class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to '/logs'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:error] = "You must fill out all fields to sign up."
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/logs'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/logs'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id	
      redirect to '/logs'
    else
      flash[:error] = "Invalid email address or password. Please try again."
      redirect to '/login'
    end	
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

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
      erb :'/users/show'
  end
end	