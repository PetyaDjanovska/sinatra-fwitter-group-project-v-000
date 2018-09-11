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

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])
    if logged_in? && @tweet.user_id == current_user.id
      erb :'/tweets/edit'
    else
      flash[:message] = "Not allowed to edit, sorry!"
      redirect '/tweets'
    end
  end

  post '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
   if logged_in? && @tweet.user_id == current_user.id
     params[:tweet].each do |k,v|
       if !v.empty?
         @tweet.update_attributes(k => v)
       end
     end
     @tweet.save
     redirect '/users/home'
   else
     redirect '/users/home'
   end
  end
end
