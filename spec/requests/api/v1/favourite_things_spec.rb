require 'rails_helper'

RSpec.describe "Api::V1::FavouriteThings", type: :request do

  before do 
     
    @user = create :user, email: "mak3er@gmail.com", password: "password"

    @login_url = '/api/v1/auth/sign_in'
    @favourite_things_url = '/api/v1/favourite_things'

    @user_params = {
      email: @user.email,
      password: @user.password
    }

    @favourite_things_params = {
      favourite_thing: {name: 'cat'}
    }

    post @login_url, params: @user_params
    
    @headers = {
      'access-token' => response.headers['access-token'],
      'client' => response.headers['client'],
      'uid' => response.headers['uid']
    }

  end


  describe "POST /create" do

   
    context "when user is not authenticated to create favourite thing" do
      it "returns http status unauthorized" do
        post @favourite_things_url, params: @favourite_things_params
        expect(response).to have_http_status(:unauthorized)  
      end

    end

    context "when user is Authenticated" do
      

      context "and new favourite thing created " do
        subject { post @favourite_things_url, params: @favourite_things_params, headers: @headers } 
        it "increment FavouriteThing.count by 1" do
        
          expect{
            subject
          }.to change{FavouriteThing.count}.by(1)
        end

        it "returns https status :created" do
          subject
          expect(response).to have_http_status(:created)
        end
        
        
      end

      context "and new favourite thing failedbe created " do
        subject { post @favourite_things_url, params: {favourite_thing: {name: ''}}, headers: @headers } 
       

        it "returns https status :created" do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end
        
        
      end
      
      
    end
    
  end


  describe "GET #index" do

    before do 
      30.times do |n| 
        create :favourite_thing, name: "name#{n}", user: @user
      end

    end
    
    context "when user is not authenticated" do
      it "returns http status unauthorized" do
        get @favourite_things_url, params: {page: 1}
        expect(response).to have_http_status(:unauthorized)  
      end

    end


    context "when user is authenticated," do

      before do 
        get @favourite_things_url, params: {page: 1}, headers: @headers
        @json_body = JSON.parse(response.body)

      end

      it "returns proper first json response of the list of favourite things " do
        expect(@json_body.first).to include({
          'name' => 'name0',

        })
      end

      it "returns proper last json response of the list of favourite things " do
        expect(@json_body.last).to include({
          'name' => 'name9',
          
        })
      end

      it "returns proper lenght of the list of favourite things returned as json response " do
        expect(@json_body.length).to eq(10)
      end


      
      
    end
    
  end



  describe "GET #show" do

    before do 
      favourite_thing = create :favourite_thing, name: "dog", id: 4, user: @user

      create :favourite_thing_type, name: "american eskimo", favourite_thing: favourite_thing
    end
    
    context "when user is not authenticated" do
      it "returns http status unauthorized" do
        get '/api/v1/favourite_things/4'
        expect(response).to have_http_status(:unauthorized)  
      end

    end

    context "when user is authenticated," do
      context "and favourite_things was found" do

        before do 
          get '/api/v1/favourite_things/4', headers: @headers
          @json_body = JSON.parse(response.body)
        end

        it "returns proper json response of the favourite thing" do
          expect(@json_body['favourite_thing']).to include({
            'name' => 'dog'
          })  
        end


        it "returns list of favourite_things types" do
          expect(@json_body['favourite_thing_types'].first).to include({
            'name' => 'american eskimo'
          }) 
        end
        

        it "returns https status :ok" do
          expect(response).to have_http_status(:ok)  
        end
        
        
      end
      
      
    end
    
  end
  
end
