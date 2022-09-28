class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweets = Tweet.new 
  end
  
  def create
    @tweets = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if @tweets.save
      flash[:notice] = '1レコード追加しました'
      redirect_to '/'
    else
      render 'new'
    end
  end
  
  def destroy
    b = Tweet.find(params[:id])
    b.destroy
    flash[:notice] = '削除しました'
    redirect_to '/'
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
      redirect_to '/'
    else
      render 'edit'
    end
  end
end
