class Api::V1::ThingTypesController < ApplicationController

    before_action :authenticate_api_v1_user!, only: :like
    before_action :find_thing_type, only: :like

    def create 
        thing_type = ThingType.create thing_type_params

        

        if thing_type.save 
            render json: thing_type, status: :created
        else
            render json: thing_type.errors.full_messages, status: :unprocessable_entity
        end

    end


    def like 

        
       
        like_result = false

        if params[:action_type] == 'up'
            @thing_type.liked_by current_api_v1_user 

            like_result = true 


        elsif params[:action_type] == 'down'

            @thing_type.unliked_by current_api_v1_user
            like_result = false 
        end

        render json: {like_status: like_result, total_likes: @thing_type.get_likes.size}, status: :ok



    end

    private 

    def thing_type_params 
        params.require(:thing_type).permit(:name, :url, :thing_id)
    end

    def find_thing_type 
        @thing_type = ThingType.find_by_id(params[:id])


        unless @thing_type 
            render json: "not found", status: :not_found
        end
    end
end
