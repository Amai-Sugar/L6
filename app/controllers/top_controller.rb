class TopController < ApplicationController

    def logout
        session.delete(:login_uid)
        @current_user = nil
        redirect_to root_path
    end

  def login
    
  end
  def login_check
      @current_uid = params[:uid]
      @input_pass = params[:pass]
      @user = User.find_by(uid: @current_uid)
          
      if @user.nil?
          render top_error_path
      elsif BCrypt::Password.new(@user.pass) == @input_pass
        @tweets = Tweet.all
        session[:login_uid] = @user
        session[:id] = @user.id
        redirect_to tweets_index_path
      else
        render top_error_path
      end
  end
  
  def main
    @tweets = Tweet.all
  end
  
end
