class TweetsController < ApplicationController

  def index
    if session[:login_uid] == nil
      @tweets = Tweet.all
      redirect_to top_main_path
    else
      @tweets = Tweet.all
      render tweets_index_path
    end
  end
  
  def show
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    params[:tweet][:user_id] = session[:id]
    @tweet = Tweet.new(message: params[:tweet][:message], user_id: params[:tweet][:user_id])
    if @tweet.save
      redirect_to '/tweets/index'
    else
      flash[:notice] = "エラーっすよ"
      render tweets_new_path
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = "ツイートを削除しました"
    redirect_to '/tweets/index'
  end
end
