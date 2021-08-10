class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :return_index, except: [:index,:show]

  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
    else
      flash.now[:error_tweet] = "つぶやきの内容は必須です。140文字以内で投稿してください。"
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
    @likes = @tweet.tweet_likes.includes(:user)  
  end

  def cauch_learning
    
  end

  private

  def return_index
    unless user_signed_in?
      redirect_to "/"
    end
  end

  def tweet_params
    params.require(:tweet).permit(:tweet).merge(user_id:current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end


end
