class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
    if logged_in?
      @tweet = Tweet.new(params[:tweet])
      @tweet.user_id = current_user.id
      @tweet.save
      redirect_to '/tweets/:id'
    else
      redirect_to '/'
    end
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/show'
  end

end
