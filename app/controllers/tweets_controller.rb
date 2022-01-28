class TweetsController < ApplicationController
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
      flash[:notice] = "投稿しました"
    else
      redirect_to new_tweet_path
      flash[:alert] = "投稿できませんでした"
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:text).merge(user_id: current_user.id)
    end
end
