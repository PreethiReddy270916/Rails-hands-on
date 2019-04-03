class StaticPagesController < ApplicationController

  def home
    @tweet = current_user.tweets.build if loggedin?
  end

  def help
  end

  def about
  end

  def contact
  end
end