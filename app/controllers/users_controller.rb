class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def following
        @user = User.find(params[:id])
        @title = "Following #{@user.name}"
        @users = @user.following
        render 'show_follow'
    end

    def followers
        @user = User.find(params[:id])
        @title = "Followers #{@user.name}"
        @users = @user.followers
        render 'show_follow'
    end
end
