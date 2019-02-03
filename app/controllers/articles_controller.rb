class ArticlesController < ApplicationController

  # get all the articles with the articles index action
  get '/articles' do
    # binding.pry
    if logged_in?

      @user = User.find_by(id: session[:user_id])

      @articles = Article.all
      # render all article instances to the articles index page
      erb :'/articles/index'
    else
      redirect '/login'
    end
  end

  get '/articles/error' do

    erb :'/articles/error'
  end

  # articles/new action
  get '/articles/new' do # route / url
    if logged_in?

    # render a new post form
      erb :'/articles/new'
    else
      erb :'/articles/error'
    end
  end

  # ARTICLE POST ACTION GOES HERE
  post '/articles' do
    if logged_in?
      if params[:content] == ""

        redirect to "/articles/new"
      else
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        @article.user = User.find_by(id: session[:user_id])
        @article.save

        redirect to '/users/analysis'
      end
      else
      redirect to '/login'
    end
    # create Article to User association here, see Pirates lab
    # params[:article][:user].each do |user_data|
    # user = User.new(user_data)

    # Where is this going to get the user data of the user currently logged in?
    # binding.pry


    # binding.pry

  end

  # find an article by its id using dynamic assignment with articles show action
  # :id is a route variable
  get '/articles/:id' do
    @article = Article.find(params[:id])
    #=> show articles on user dashboard associated to user id
    # render the articles show template
    erb :'/articles/show'
  end

  # ARTICLE LOAD FORM TO EDIT ACTION
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    # if @article.user.id == current_user.id

    # else
    #   redirect '/articles'
    # end
    # render the articles edit form
      erb :'/articles/edit'
  end

  # ARTICLE EDIT/UPDATE ACTION
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.save

    redirect to '/users/dashboard'
  end

  # CA DELETE ARTICLE ACTION
  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.delete

    redirect to '/users/dashboard'
  end

end
