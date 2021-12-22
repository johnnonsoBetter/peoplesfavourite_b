require 'rails_helper'


RSpec.describe "Thing", type: :routing do

    describe "GET #index" do
        it "routes api/v1/things to api/v1/things#index" do
            expect(get '/api/v1/things').to route_to('api/v1/things#index')  
        end
        
    end
    
end
