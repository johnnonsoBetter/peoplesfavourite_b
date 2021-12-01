require 'rails_helper'


RSpec.describe User, type: :routing do

    describe "GET #favourite_things" do
        it "routes api/v1/users/john-doe/favourite_things/ to api/v1/users#favourite_things" do
            expect(get '/api/v1/users/john-doe/favourite_things/').to route_to(controller: 'api/v1/users', :id => 'john-doe', action: 'favourite_things')  
        end
        
    end

    describe "GET #show" do
        it "routes api/v1/users/john-doe/ to api/v1/users#show" do
            expect(get '/api/v1/users/john-doe').to route_to(controller: 'api/v1/users', :id => 'john-doe', action: 'show')  
        end
    
    end
end
