require 'rails_helper'


RSpec.describe "ThingTypes", type: :routing do

    describe "POST #create " do

        it " api/v1/words to api/v1/words#create" do
            expect(post '/api/v1/words').to route_to('api/v1/words#create') 
        end
        
       
    end


end
