require 'rails_helper'

RSpec.describe "Api::V1::Things", type: :request do

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


  describe "GET /index" do
    before do 
      create :thing, name: "vegetables"
       create :thing, name: "gadgets"
       thing = create :thing, name: "pets"


       create :favourite_thing, user: @user, thing: thing, name: "thing"

      



      @things_url = '/api/v1/things'
    end



    context "when user is not authenticated" do

      it "returns http status :unauthorized" do
        get @things_url
        expect(response).to have_http_status(:unauthorized)  
      end
      
      
    end
    

    context "when user is authenticated" do
      before do 
        get @things_url, headers: @headers
        @json_data = JSON.parse(response.body)
      end


      it "returns first thing from the things list" do
        
        expect(@json_data.first).to include({
          'name' => 'vegetables'
        })
      end

      it "returns last thing from the things list" do
        
        expect(@json_data.last).to include({
          'name' => 'pets'
        })
      end
      
    end
    
    
  end
end
