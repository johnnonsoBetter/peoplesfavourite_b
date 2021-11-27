require 'rails_helper'

RSpec.describe FavouriteThingType, type: :routing do 

    

    describe "POST #create" do
        it "routes api/v1/favourite_thing_types to api/v1/favourite_thing_types#create" do
            expect(post '/api/v1/favourite_thing_types').to route_to('api/v1/favourite_thing_types#create')  
        end
        
    end

end