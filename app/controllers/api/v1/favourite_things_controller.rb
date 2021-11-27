class Api::V1::FavouriteThingsController < ApplicationController
    before_action :authenticate_api_v1_user!, only: [:create, :index, :show]
    before_action :find_favourite_thing, only: :show

    def create 
        favourite_thing = FavouriteThing.new favourite_thing_params
        favourite_thing.user = current_api_v1_user

        if favourite_thing.save
            render json: favourite_thing, status: :created 
        else
            render json: favourite_thing.errors.messages, status: :unprocessable_entity
        end

    end


    def index 

        @favourite_things = current_api_v1_user.favourite_things.page(params[:page])

        render 'api/v1/favourite_things/index.json.jbuilder'

    end


    def show 

        
       

      
        render 'api/v1/favourite_things/show.json.jbuilder'
    end


    private 

    def find_favourite_thing
        @favourite_thing = current_api_v1_user.favourite_things.find_by_id(params[:id])
        
        unless @favourite_thing 
            render json: "Favourite thing not found", status: :not_found
        end
    end

    def favourite_thing_params
        params.require(:favourite_thing).permit(:name, :photo)
    end
end
