class EntrysController < ApplicationController

    get "/entry/new" do
        if logged_in?
            @logs = current_user.logs
            erb :"/entrys/new"
        else
            flash[:message] = "You must be logged in to view this page."
            redirect to "/login"
        end
    end

    post "/entry" do
      if Entry.new(params[:entry]).valid?
        @entry = current_user.entrys.create(params[:entry])
        @entry.save
      if !params[:log][:title].empty?
          @Entry.logs << Log.create(title: params[:log][:title])
      end
            redirect "/entrys/#{@entry.slug}"
      else
            flash[:new_entry] = "Please create your entry."
            redirect '/entrys/new'
            end
        end
    end

    get "/entry/:id" do 
        if logged_in?
            @entry = Entry.find_by_id(params[:id])
            erb :'entrys/show_entry'
        else
            redirect to '/login'
        end
    end

    get "/entry/user_id/edit" do
        if logged_in?
            @entry = current_user.entrys.find_by(user_id: params[:user_id]) 
            #vs just id
            if @entry
                @logs = current_user.logs
                erb :"/entrys/edit"
            else
                redirect to "/logs"
        end
        else
            redirect to '/login'
        end
    end

    patch '/entrys/:id' do 
        #updates entrys based on ID in the url
        if logged_in? && params[:user_id] == "" || params[:title] == ""
               redirect to "/entrys/#{params[:user_id]}/edit"
        else
            @entry = Entry.find_by_id(params[:user_id])
            if @entry && @entry.user == current_user
                @entry.update(user_id: params[:user_id], title: params[:title], points: params[:points])
                flash[:success] = "You have successfully edited this entry."
                if !params[:log][:title].empty?
                    @entry.logs << Log.create(title: params[:log][:title])
                # redirect "/entrys/#{params[:user_id]}"
            else
                flash[:error] = "You are not authorized to edit this entry."
                redirect to '/entrys'
            end
        end
    end

    get "/entry/:id/delete" do
        if logged_in?
            entry = current_user.entrys.find_by(id: params[:id])
            if entry && entry.destroy
                log = Log.find_by(id: entry.log_id)
                flash[:error] = "Your entry has been deleted."
                redirect to "/logs/#{log.id}"
            else
                redirect to "/logs" 
        end

        else
            flash[:error] = "You must log in to delete an entry."
            redirect to "/login"
        end
    end
end
