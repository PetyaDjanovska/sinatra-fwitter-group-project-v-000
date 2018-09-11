class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
    @user = current_user

  end

end
