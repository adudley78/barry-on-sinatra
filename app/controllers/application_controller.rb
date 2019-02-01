require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, SecureRandom.hex(64)
  end

  # root/route, get the homepage
  get "/" do
    # render the homepage
    erb :home
  end

  # helpers do
  #   def logged_in?
  #     !!current_user
  #   end
  #
  #   def current_user
  #     @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  #   end

  # end


  # controllers pass data to the view with instance variables

  # helpers do
  #
  #   def current_user
  #     User.find_by(session[:username]) # username or user_id foreign key?
  #   end
  #
  #   def logged_in?
  #     !!current_user
  #   end
  #
  #   def if_not_logged_in # need argument of associated user_id
  #     redirect '/home' unless logged_in?
  #     end
  #   end

end
