# creates and deletes sessions
class SessionsController < ApplicationController

  get '/login' do

    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    # session[:username] = params[:username]
    # raise session[:username].inspect
    # authenticate the user using the submitted password
    if user && user.authenticate(params[:password])
      # log in the user
      # binding.pry
      session[:user_id] = user.id
      # binding.pry
      redirect to '/articles'
    else
      # change to custom wrong login credentials view
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
  end

end
