class Api::V1::ThingsController < ApplicationController
    before_action :authenticate_api_v1_user!, only: :index


    def index 

        
        @things = Thing.all
        @user_fav_ids = current_api_v1_user.favourite_things.pluck(:thing_id)

        render 'api/v1/things/index.json.jbuilder'
    end
end
