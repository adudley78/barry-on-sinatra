class ArticlesController < ApplicationController

  # get all the articles with the articles index action
  get '/articles' do
    binding.pry
    if session[:user_id]

      @articles = Article.all
      # render all article instances to the articles index page
      erb :'/articles'
    else
      redirect '/login'
    end
  end

  # articles/new action
  get '/articles/new' do # route / url
    # if if_not_logged_in

    # render a new post form
      erb :'/articles/new'
  end

  # find an article by its id using dynamic assignment with articles show action
  # :id is a route variable
  get '/articles/:id' do
    @article = Article.find(params[:id])
    #=> needs to show articles on user dashboard associated to user id
    # render the articles show template
    erb :'/articles/show'
  end


  # ARTICLE POST ACTION GOES HERE
  post '/articles' do
    article = Article.create(title: params[:article][:title], content: params[:article][:content])
    # create Article to User association here, see Pirates lab
    # article.user
    redirect to "/articles"
  end

  # ARTICLE LOAD FORM TO EDIT ACTION
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    # render the articles edit form
    erb :'/articles/edit'
  end

  # ARTICLE EDIT/UPDATE ACTION
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.save

    redirect to '/articles'
  end

  # CA DELETE ARTICLE ACTION
  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.delete

    redirect to '/articles'
end

end
