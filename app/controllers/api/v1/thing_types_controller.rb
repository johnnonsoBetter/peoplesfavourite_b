class Api::V1::ThingTypesController < ApplicationController

    def create 
        thing_type = ThingType.create thing_type_params

        

        if thing_type.save 
            render json: thing_type, status: :created
        else
            render json: thing_type.errors.full_messages, status: :unprocessable_entity
        end

    end

    private 

    def thing_type_params 
        params.require(:thing_type).permit(:name, :url, :thing_id)
    end
end
