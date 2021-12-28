class Api::V1::GuessesController < ApplicationController 
    before_action :authenticate_api_v1_user!, only: :show

    def show
         
        @user = current_api_v1_user
        @guess =   @user.guesses.create_with(thing_type_id: params[:thing_type_id], user: @user).find_or_create_by(thing_type_id: params[:thing_type_id])
    
        render 'api/v1/guesses/show.json.jbuilder'
    end
end
