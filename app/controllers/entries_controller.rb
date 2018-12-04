class EntriesController < ApplicationController

  get '/entries' do
    # if logged_in?
      # @user = current_user
      @entries = Entry.all
      erb :'entries/index'
    # else
    #   flash[:failure] = "Signup or login to access your volunteer entries."
    #   redirect '/'
    # end
  end

  get '/entries/new' do
    if logged_in?
      erb :'entries/new'
    else
      flash[:failure] = "Signup or login to create a new volunteer entry."
      redirect '/login'
    end
  end

  post '/entries' do
    if logged_in?
      if params[:description] == "" || params[:title] == ""
        redirect "/entries/new"
      else
        @entry = Entry.create(title: params[:title], description: params[:description], location: params[:location], date: params[:date], user_id: session[:user_id])
        flash[:success] = "You have created a new entry!"
        redirect "/entries/#{@entry.id}"
      end
    else
      redirect '/login'
    end
  end

  # get '/entries/index' do
  #   @entry = Entry.find_by_id(params[:id])
  #   @entries = Entry.all
  #   erb :'/entries/index'
  # end

  get '/entries/all_users' do
    # @entry = Entry.find_by_id(params[:id])
    @entries = Entry.all
    erb :'/entries/all_users'
  end

  get '/entries/:id' do
    if logged_in?
      @user = current_user
      @entry = Entry.find_by_id(params[:id])
      erb :'/entries/show'
    else
      flash[:failure] = "Sign up or login to access entries."
      redirect '/login'
    end
  end

  get '/entries/:id/edit' do
    if logged_in?
       @entry = Entry.find_by_id(params[:id])
       if @entry.user_id == current_user.id
          erb :'/entries/edit'
       else
          flash[:failure] = "You cannot edit an entry that does not belong to you."
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
        if @entry.user_id == current_user.id
          if @entry.update(title: params[:title], description: params[:description], location: params[:location], date: params[:date], user_id: session[:user_id])
            flash[:success] = "You have successfully edited this entry."
            redirect  "/entries/#{@entry.id}"
          else
            redirect "/entries/#{@entry.id}/edit"
          end
        else
          flash[:failure] = "You cannot edit an entry that does not belong to you."
          redirect '/login'
        end
      end
    else
      redirect '/login'
    end
  end

  delete '/entries/:id/delete' do
    if logged_in?
      @entry = Entry.find_by_id(params[:id])
      if @entry.user_id == current_user.id
        @entry.delete
        flash[:failure] = "You have permanently deleted this entry."
      end
      redirect '/entries'
    else
      flash[:failure] = "You are not authorized to delete this entry."
      redirect '/login'
    end
  end
end


