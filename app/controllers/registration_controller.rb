class RegistrationController < ApplicationController

  get '/registrations/signup' do

    erb :'/registrations/signup'
  end

  post '/registrations' do
    user = User.new(username: params["username"], email: params["email"], password: params["password"])
    user.save
    session[:user_id] = user.id

    redirect 'users/dashboard'
  end

end
