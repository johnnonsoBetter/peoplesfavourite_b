require 'rails_helper'

RSpec.describe "Api::V1::ThingTypes", type: :request do
  describe "POST /create" do
    before do 
      create :thing, id: 9, name: "dogs"
      @thing_type_params = {
        thing_type: {
          name: "american  eskimo",
          url: 'https://hello.com',
          thing_id: 9
        }
      }

      @thing_type_url = '/api/v1/thing_types'
    end


    context "when the thing type has been created" do
      it "returns http status :created" do
        post @thing_type_url, params: @thing_type_params

        expect(response).to have_http_status(:created)  

        
      end

      it "increment ThingType.count by 1" do
        expect{
          post @thing_type_url, params: @thing_type_params
      }.to change{ThingType.count}.by(1)
      end
      
      
    end

    context "when the thing type fails to be created" do

      it "returns https status :unprocessable_entity" do
        post @thing_type_url, params: {thing_type: {name: "", url: "https://shsflshsd"}}

        expect(response).to have_http_status(:unprocessable_entity)  

      end
      
    end
    
    




    
  end
end
