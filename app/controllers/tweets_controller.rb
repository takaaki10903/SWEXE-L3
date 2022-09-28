class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    logger.debug @tweets.count
  end
  
  def new
    @tweets = Tweet.new 
  end
  
  def create
    @tweets = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if @tweets.save
      flash[:notice] = '1レコード追加しました'
      redirect_to root_path
    else
      render new_path
    end
  end
  
  def destroy
    b = Tweet.find(params[:id])
    b.destroy
    flash[:notice] = '削除しました'
    redirect_to root_path
  end
  
  def show
    @tweets = Tweet.find(params[:id])
  end
  
  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    @tweets = Tweet.find(params[:id])
    @tweets.update(message: params[:tweet][:message])
    if @tweets.save
      flash[:notice] = '更新できました'
      redirect_to root_path
    else
      render edit_tweet_path
    end
  end
end
