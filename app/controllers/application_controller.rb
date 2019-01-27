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

  # get all the articles
  get '/articles' do
      @articles = Article.all

      # render to the page
      erb :articles
    end

end
