require 'rails_helper'


RSpec.describe Like, type: :routing do

    describe "GET #index" do
        it "routes api/v1/likes to api/v1/likes#index" do
            expect(get '/api/v1/likes').to route_to('api/v1/likes#index')  
        end
        
    end

    
end
