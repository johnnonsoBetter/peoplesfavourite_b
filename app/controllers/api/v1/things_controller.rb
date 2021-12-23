class Api::V1::ThingsController < ApplicationController
    before_action :authenticate_api_v1_user!, only: [:index, :show]
    before_action :find_thing, only: :show


    def index 

        
        @things = Thing.all
        @user_fav_ids = current_api_v1_user.favourite_things.pluck(:thing_id)

        render 'api/v1/things/index.json.jbuilder'
    end

    def show 
        render 'api/v1/things/show.json.jbuilder'
    end

    private 

    def find_thing 

        begin 
            @thing = Thing.all.friendly.find(params[:id])
        rescue
            render json: "Thing Not Found", status: :not_found
        end

        
    end
end
