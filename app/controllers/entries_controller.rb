class EntriesController < ApplicationController

  get '/entries' do
    if logged_in?
      @user = current_user
      session[:user_id] = @user.id
      @entries = Entry.all
      erb :'entries/index'
    else
      redirect '/login'
    end
  end

  get '/entries/new' do
    if logged_in?
      erb :'entries/new'
    else
      redirect '/login'
    end
  end

  post '/entries' do
    if logged_in?
      if params[:description] == ""
        redirect "/entries/new"
      else
        @entry = current_user.entries.build(title: params[:title], description: params[:description], location: params[:location], date: params[:date])
        if @entry.save
          redirect "/entries/#{@entry.id}"
        else
          redirect "/entries/new"
        end
      end
    else
      redirect '/login'
    end
  end

  get '/entries/:id' do
    if logged_in?
      @user = current_user
      @entry = Entry.find_by_id(params[:id])
      erb :'entries/show'
    else
      redirect '/login'
    end
  end

  get '/entries/:id/edit' do
    if logged_in?
      @entry = Entry.find_by_id(params[:id])
      if @entry && @entry.user == current_user
        erb :'entries/edit'
      else
        redirect '/entries'
      end
    else
      redirect '/login'
    end
  end

  patch '/entries/:id' do
    if logged_in?
      if params[:description] == ""
        redirect "/entries/#{params[:id]}/edit"
      else
        @entry = Entry.find_by_id(params[:id])
        if @entry && @entry.user == current_user
          if @entry.update(title: params[:title], description: params[:description], location: params[:location], date: params[:date])
            redirect  "/entries/#{@entry.id}"
          else
            redirect "/entries/#{@entry.id}/edit"
          end
        else
          redirect '/entries'
        end
      end
    else
      redirect '/login'
    end
  end

  delete '/entries/:id/delete' do
    if logged_in?
      @entry = Entry.find_by_id(params[:id])
      if @entry && @entry.user == current_user
        @entry.delete
      end
      redirect '/entries'
    else
      redirect '/login'
    end
  end
end
  # helpers do 
  #   def log_entry
  #     @all_entries = [] 
  #     current_user.entries.map do |entry|
  #       if log.entries.include?(@entry) 
  #         log.entries.map do |entry|
  #           @all_entries << entry.name
  #       end
    #   end
    # end


