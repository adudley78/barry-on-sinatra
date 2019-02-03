class UsersController < ApplicationController

  get '/users/dashboard' do
      @user = User.find(session[:user_id])

      erb :'/users/dashboard'
  end

  get '/users/analysis' do
      @user = User.find(session[:user_id])

      erb :'/users/analysis'
  end

end
