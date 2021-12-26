require 'rails_helper'


RSpec.describe "Guesses", type: :routing do

    describe "GET #show " do

        it " api/v1/guesses to api/v1/guesses#show" do
            expect(get '/api/v1/guesses/5').to route_to(controller: 'api/v1/guesses', action: 'show', thing_type_id: '5') 
        end
        
    end

end
