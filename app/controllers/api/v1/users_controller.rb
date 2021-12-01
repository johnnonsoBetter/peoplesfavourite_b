class Api::V1::UsersController < ApplicationController
    before_action :authenticate_api_v1_user!, only: [:index, :favourite_things, :show]
    before_action :find_user, only: [:favourite_things, :show]

    def index 
        @users = User.where.not(id: current_api_v1_user.id).page(params[:page])
        render 'api/v1/users/index.json.jbuilder'
    end

    def favourite_things
        @favourite_things = @user.favourite_things.page(params[:page])
        render 'api/v1/users/favourite_things.json.jbuilder'
    end

    def show 
        render 'api/v1/users/show.json.jbuilder'
    end

    private
    def find_user 
        @user = User.all.friendly.find_by_slug(params[:id])


        unless @user 
            render json: ["User Not Found"], status: :not_found
        end
        
    end
    
end
