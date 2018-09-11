class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
    if logged_in?
      @tweet = Tweet.new(params[:tweet])
      @tweet.user_id = current_user.id
    end
  end

end
