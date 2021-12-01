require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do

  before do 
     
    @user = create :user, id: 4, email: "mak3er@gmail.com", password: "password", name: 'paul'
    
    @login_url = '/api/v1/auth/sign_in'
    @user_url = '/api/v1/users'

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
  
  describe "GET #index" do

    before do 
    
      30.times do |n| 
        create :user, name: "name#{n}", email: "#{n}@mail.com", password: "password"
      end

    end
    
    context "when user is not authenticated" do
      it "returns http status unauthorized" do
        get @user_url, params: {page: 1}
        expect(response).to have_http_status(:unauthorized)  
      end

    end


    context "when user is authenticated," do

      before do 
        get @user_url, params: {page: 1}, headers: @headers
        
        @json_body = JSON.parse(response.body)

      end

      # it "returns proper first json response of the list of users  " do
      #   expect(@json_body.first).to include({
      #     'name' => 'name0',

      #   })
      # end

      it "returns proper last json response of the list of users  " do
        expect(@json_body.last).to include({
          'name' => 'name9',
          
        })
      end

      it "returns proper lenght of the list of users  returned as json response " do
        expect(@json_body.length).to eq(10)
      end


      
      
    end
    
  end

  describe "GET #favourite_things" do

      before do 
        @user_favourite_things_url = '/api/v1/users/paul/favourite_things/'
        30.times do |n| 
          create :favourite_thing, name: "name#{n}", user: @user
        end

      end

      context "when user is not authenticated" do
        it "returns http status unauthorized" do
          get @user_favourite_things_url, params: {page: 1}
          expect(response).to have_http_status(:unauthorized)  
        end
  
      end

      context "when user is authenticated" do

        context "when the params id for the user is not valid or not found" do

          it "returns http status :not_found" do

            get '/api/v1/users/jacob/favourite_things/', params: {page: 1}, headers: @headers
            
            expect(response).to have_http_status(:not_found)
          end
          
          
        end
        
        context "when the params id for the user is valid or  found" do 

          before do 
            get @user_favourite_things_url, params: {page: 1}, headers: @headers
            
            @json_body= JSON.parse(response.body)
    
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
      
  end


  describe "GET #show" do

    before do 
      @user_url = '/api/v1/users/paul'
      10.times do |n| 
        create :favourite_thing, name: "name#{n}", user: @user
      end

    end


    context "when user is not authenticated" do
      it "returns http status unauthorized" do
        get @user_url
        expect(response).to have_http_status(:unauthorized)  
      end

    end

    context "when user is authenticated" do

      context "and user is not found" do

        it "returns http status :not_found" do

          get '/api/v1/users/jacob/', headers: @headers
          
          expect(response).to have_http_status(:not_found)
        end
        
        
      end


      context "and user is found" do

        before do 
          get @user_url, headers: @headers
          @json_body = JSON.parse(response.body)
        end

        it "returns proper user json response" do
          expect(@json_body['user']).to include({
            'name' => 'paul'
          })
        end


        it "returns first favourite_thing from list of user favourite things" do
          expect(@json_body['user']['favourite_things'].first).to include({
            'name' => 'name0'
          })
        end

        it "returns last favourite_thing from list of user favourite things" do
          expect(@json_body['user']['favourite_things'].last).to include({
            'name' => 'name9'
          })
        end
        
        
      end
      
      
    end
    
    
    
  end
  
  



end
