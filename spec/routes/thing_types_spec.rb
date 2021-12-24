require 'rails_helper'


RSpec.describe "ThingTypes", type: :routing do

    describe "POST #create " do

        it " api/v1/thing_types to api/v1/thing_types#create" do
            expect(post '/api/v1/thing_types').to route_to('api/v1/thing_types#create') 
        end
        
       
    end


end
