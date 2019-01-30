require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # root/route, get the homepage
  get "/" do
    # render the homepage
    erb :home
  end

  # controllers pass data to the view with instance variables

  end
