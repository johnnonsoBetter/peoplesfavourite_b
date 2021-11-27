require 'rails_helper'


RSpec.describe FavouriteThing, type: :routing do

    describe "POST #create" do
        it "routes api/v1/favourite_things to api/v1/favourite_things#create" do
            expect(post '/api/v1/favourite_things').to route_to('api/v1/favourite_things#create')  
        end
        
    end


    describe "GET #index" do
        it "routes api/v1/favourite_things to api/v1/favourite_things#index" do
            expect(get '/api/v1/favourite_things').to route_to('api/v1/favourite_things#index')  
        end
        
    end


    
    
    
end
