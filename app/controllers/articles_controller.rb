class ArticlesController < ApplicationController

  # get all the articles with articles index action
  get '/articles' do
      @articles = Article.all
      # render to the articles index page
      erb :'articles/index'
  end

  # articles/new action
  get '/articles/new' do # route / url

    # render a new post form
    erb :'articles/new'
  end

  # ARTICLE POST ACTION GOES HERE
  # post '/articles' do

  #end

  # find an article by its id using dynamic assignment with articles show action
  # :id is a route variable
  get 'articles/:id' do
    @article = Article.find(params[:id])
    #=> needs to show articles on user dashboard associated to user id
    # render the articles show template
    erb :'articles/show'
  end

  # ARTICLE LOAD FORM TO EDIT ACTION
  # get '/articles/:id/edit' do

  #end

  # ARTICLE UPDATE ACTION
  # post 'articles/:id' do

  # end

  # CA DELETE ARTICLE
  # post 'articles/:id/delete' do

  # end

end
