require 'rails_helper'

RSpec.describe FavouriteThingType, type: :routing do 

    

    describe "POST #create" do
        it "routes api/v1/favourite_thing_types to api/v1/favourite_thing_types#create" do
            expect(post '/api/v1/favourite_thing_types').to route_to('api/v1/favourite_thing_types#create')  
        end
        
    end

    describe "DELETE #destroy" do 
        it "routes api/v1/favourite_thing_types to api/v1/favourite_thing_types#destroy" do
            expect(delete '/api/v1/favourite_thing_types/4').to route_to(id: "4", controller: "api/v1/favourite_thing_types", action: "destroy")  
        end
    end

end