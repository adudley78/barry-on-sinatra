require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password"
  end

  # root/route, get the homepage
  get "/" do # this is a controller action (method) and a route (URL)
    # render the #home page
    erb :home
  end

  get "/about" do

    erb :about
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      # use memoization so the database isn't accessed every time method is called
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

  # custom method to generate pseudo-score
  def pseudo_score_randomizer
    pseudo_score = Random.new
    pseudo_score.rand(1..100)
  end

end
