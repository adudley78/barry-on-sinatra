class ArticlesController < ApplicationController

  # get all the articles with the articles index action
  get '/articles' do
    if logged_in?
      @user = User.find_by(id: session[:user_id]) # access instance variable current_user
      @articles = Article.all
      # render the articles index page
      erb :'/articles/index' # replace in view w/ current_user
    else
      redirect '/login'
    end
  end

  get '/articles/error' do

    erb :'/articles/error'
  end

  # articles/new action
  get '/articles/new' do
    if logged_in?

      # render the new post view/form
      erb :'/articles/new'
    else
      erb :'/articles/error'
    end
  end

  post '/articles' do
    if logged_in?
      if params[:article][:content] == ""

        redirect to '/articles/new'
      else
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        @article.user = User.find_by(id: session[:user_id])
        @article.save

        redirect to '/users/analysis'
      end
    else
    redirect to '/login'
    end
  end

  # find an article by its id using dynamic assignment with articles show action
  # :id is a route variable
  get '/articles/:id' do
    if logged_in?
      @article = Article.find(params[:id])

      erb :'/articles/show'
    else
      erb :'/articles/error'
    end
  end

  get '/articles/:id/edit' do
    if logged_in?
      @article = Article.find(params[:id])

      erb :'/articles/edit'
    else
      erb :'/articles/error'
    end
  end

  patch '/articles/:id' do
    if logged_in?
      @article = Article.find(params[:id])
      @article.title = params[:article][:title]
      @article.content = params[:article][:content]
      @article.save

      redirect to '/users/dashboard'
    else
      erb :'/articles/error'
    end
  end

  delete '/articles/:id/delete' do
    if logged_in?
      @article = Article.find(params[:id])
      @article.delete

      redirect to '/users/dashboard'
    else
      erb :'/articles/error'
    end
  end

end
