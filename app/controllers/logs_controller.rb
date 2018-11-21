class LogsController < ApplicationController
    
    get '/logs' do
        if logged_in? 
            @user = current_user
            session[:user_id] = @user.id
            @entries = Entry.all 
            erb :'/logs/show'
        else 
            flash[:index_message] = "Signup or login to access entries."
            redirect to '/login'
        end
    end

    get '/logs/new' do
        if logged_in?
            erb :'/logs/new'
        else 
            flash[:index_message] = "Signup or login to create a new entry."
            redirect to '/login'
        end
    end
    
    post '/logs' do
        if logged_in?
            @log = Log.create(title: params[:title], points: params[:points], user_id: session[:user_id])
            redirect to :"/logs/#{@log.id}"
        else
            flash[:index_message] = "Signup or login to create a new entry."
            redirect to '/login'
        end
    end

    get '/logs/:id' do
        if logged_in?
            @log = Log.find_by_id(params[:id])
            @user = User.find(@log.user_id)
            erb :'/logs/show'
        else
            flash[:index_message] = "Sign up or login to access entries."
            redirect '/login'
    end
  end   
