require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password"
  end

  # root/route, get the homepage
  get "/" do
    # render the homepage
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
      # use memoization so not necessary to access database every time method is called
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

  def pseudo_score_randomizer
    pseudo_score = Random.new
    pseudo_score.rand(1..100)
  end

end
