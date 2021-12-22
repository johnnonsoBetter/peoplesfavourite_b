require 'rails_helper'


RSpec.describe "User", type: :routing do

    describe "GET #index" do
        it "routes api/v1/users to api/v1/users#index" do
            expect(get '/api/v1/users').to route_to('api/v1/users#index')  
        end
        
    end

    describe "GET #show" do
        it "routes api/v1/users to api/v1/users#show" do
            expect(get '/api/v1/users/4').to route_to(id: "4", controller: "api/v1/users", action: "show")  
        end
        
    end
    
end
