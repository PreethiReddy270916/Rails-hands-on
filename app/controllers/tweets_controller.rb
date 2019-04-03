class TweetsController < ApplicationController
  before_action :loggedin?, only: [:create, :destroy]
  def create
  	@tweet=current_user.tweets.build(tweet_params)
  	if @tweet.save
  		flash[:success]="Tweet created"
      redirect_to root_url
  	else
  		render 'staticpages/home'
  	end
  end
  def destroy

  end
  private
     def tweet_params
  	   params.require(:tweet).permit(:content) 
     end
end
