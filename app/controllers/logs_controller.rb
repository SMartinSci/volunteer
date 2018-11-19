class LogsController < ApplicationController
    

    get '/logs' do
        if logged_in? 
            @user = current_user
            session[:user_id] = @user.id
            @entries = Entry.all 
            erb :'/logs/show'
        else 
            redirect to '/login'
        end
    end

    get '/logs/new' do
        if logged_in?
            erb :'/logs/new'
        else 
            redirect to '/login'
        end
    end
    
    post '/logs' do
        if logged_in?
            @log = Log.create(title: params[:title], points: params[:points], user_id: session[:user_id])
            @log.save
            redirect to :"/logs/#{@log.id}"
        else
            redirect to '/login'
        end
    end

    get '/logs/:id' do
        @user = current_user
        @log = Log.find_by_id(params[:id])
        erb :'/logs/show'
    end
  end   
