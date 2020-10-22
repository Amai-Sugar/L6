class LikesController < ApplicationController
  def create
    tweet = params[:tweet_id]
    user = session[:id]
    Like.create(user_id: user, tweet_id: tweet)
    redirect_to tweets_index_path
  end

  def destroy
    tweet = params[:tweet_id]
    user = session[:id]
    @like = Like.find_by(user_id: user, tweet_id: tweet)
    if @like.nil?
      redirect_to tweets_index_path
    else
      @like.destroy
      redirect_to tweets_index_path
    end
  end
end
