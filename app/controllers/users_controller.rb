class UsersController < ApplicationController

  get '/users/dashboard' do
    if logged_in?
      @user = User.find(session[:user_id])

      erb :'/users/dashboard'

    else
      erb :'/articles/error'
    end
  end

  get '/users/analysis' do
      @user = User.find(session[:user_id])

      erb :'/users/analysis'
  end

end
