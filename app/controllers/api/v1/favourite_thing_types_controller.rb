class Api::V1::FavouriteThingTypesController < ApplicationController
    before_action :authenticate_api_v1_user!, only: [:create, :destroy]
    before_action :find_favourite_thing, only: :create 
    before_action :find_favourite_thing_type, only: :destroy

    def create 

        favourite_thing_type =  @favourite_thing.favourite_thing_types.new favourite_thing_type_param

        

        if favourite_thing_type.save
            render json: favourite_thing_type, status: :created
        else 
            render json: favourite_thing_type.errors.messages, status: :unprocessable_entity
        end



    end

    def destroy 

        @favourite_thing_type.destroy
    end

    private 

    def favourite_thing_type_param
        params.require(:favourite_thing_type).permit(:name)
    end

    def find_favourite_thing_type
        @favourite_thing_type = FavouriteThingType.find_by_id(params[:id])

        unless @favourite_thing_type 
            render json: "Could not find favourite thing", status: :not_found
        end
    end 

    def find_favourite_thing 
        @favourite_thing = current_api_v1_user.favourite_things.find_by_id(params[:favourite_thing_id])

        unless @favourite_thing 
            render json: "Could not find favourite thing", status: :not_found
        end
    end
end
