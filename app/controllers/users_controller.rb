class UsersController < ApplicationController

  # add logged in validation
  get '/users/dashboard' do
    # if logged_in?
      @user = User.find(session[:user_id])

      erb :'/users/dashboard'

    # else
    #   erb :'/articles/error'
    # end
  end

  get '/users/analysis' do
      @user = User.find(session[:user_id])

      erb :'/users/analysis'
  end

end
