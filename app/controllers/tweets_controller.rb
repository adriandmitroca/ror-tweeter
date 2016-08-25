class TweetsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def index
        @title = user_signed_in? ? 'Your Feed' : 'All Tweets'
        @tweets = user_signed_in? ? current_user.feed : Tweet.includes(:user).order(created_at: :desc)
        @tweet = Tweet.new
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def create
        @tweet = current_user.tweets.new(tweet_params)

        if @tweet.save
            redirect_to tweets_path
        else
            @title = user_signed_in? ? 'Your Feed' : 'All Tweets'
            @tweets = user_signed_in? ? current_user.feed : Tweet.includes(:user).order(created_at: :desc)
            render 'index'
        end
    end

    private
        def tweet_params
            params.require(:tweet).permit(:body)
        end
end
