require 'rails_helper'

RSpec.describe "Api::V1::FavouriteThingTypes", type: :request do
  before do 
     
    @user = create :user, email: "mak3er@gmail.com", password: "password"

    @login_url = '/api/v1/auth/sign_in'
    @favourite_thing_types_url = '/api/v1/favourite_thing_types'

    @user_params = {
      email: @user.email,
      password: @user.password
    }

    post @login_url, params: @user_params
    
    @headers = {
      'access-token' => response.headers['access-token'],
      'client' => response.headers['client'],
      'uid' => response.headers['uid']
    }

  end

describe "POST #create" do

    before do 
        
        create :favourite_thing, name: "dog", id: 4, user: @user
        @favourite_thing_types_params = {
          favourite_thing_id: 4,
          favourite_thing_type: {name: 'cat'}
        }


    end


    context "when user is not authenticated to create favourite thing" do
        it "returns http status unauthorized" do
          post @favourite_thing_types_url, params: @favourite_thing_types_params
          expect(response).to have_http_status(:unauthorized)  
        end
  
      end
  
      context "when user is Authenticated" do
        
  
        context "and new favourite thing type created " do
          subject { post @favourite_thing_types_url, params: @favourite_thing_types_params, headers: @headers } 
          it "increment FavouriteThing.count by 1" do
          
            expect{
              subject
            }.to change{FavouriteThingType.count}.by(1)
          end
  
          it "returns https status :created" do
            subject
            expect(response).to have_http_status(:created)
          end
          
          
        end

        context "and new favourite thing could not be found " do
          subject { post @favourite_thing_types_url, params: {favourite_thing_type: {name: ''}, favourite_thing_id: 6, }, headers: @headers } 
         
  
          it "returns https status not_found" do
            subject
            expect(response).to have_http_status(:not_found)
          end
          
          
        end


        
  
        context "and new favourite thing type failed to be created " do
          subject { post @favourite_thing_types_url, params: {favourite_thing_type: {name: ''}, favourite_thing_id: 4, }, headers: @headers } 
         
  
          it "returns https status unprocessable_entity" do
            subject
            expect(response).to have_http_status(:unprocessable_entity)
          end
          
          
        end
        
        
      end


    
  end



  describe "DELETE #destroy" do

    before do 
      favourite_thing = create :favourite_thing, name: "dog", user: @user

      create :favourite_thing_type, name: "eskimo", id: 4, favourite_thing: favourite_thing

    end
    
    context "when user is not authenticated" do
      it "returns http status unauthorized" do
        delete '/api/v1/favourite_thing_types/4'
        expect(response).to have_http_status(:unauthorized)  
      end

    end

    context "when user is authenticated," do
      context "and favourite_thing was found" do

        before do 
          
          delete '/api/v1/favourite_thing_types/4', headers: @headers
         
        end


        it "returns http status no content" do
         
         expect(response).to have_http_status(:no_content)
        end

        it "delete the favourite thing" do
         
          expect(FavouriteThingType.find_by_id(4)).to eq(nil)
        end
        
      end


      context "and favourite thing could not be found" do
        it "returns http status not_found" do
          delete '/api/v1/favourite_thing_types/24', headers: @headers
          expect(response).to have_http_status(:not_found)  
        end
        
      end
      
      
      
    end
    
  end
end
