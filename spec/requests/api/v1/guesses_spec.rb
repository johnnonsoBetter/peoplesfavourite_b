require 'rails_helper'

RSpec.describe "Api::V1::Guesses", type: :request do
  describe "GET /show" do
    before do 
     
      @user = create :user, email: "mak3er@gmail.com", password: "password"
      
      User.find_each(&:save)
      
      @login_url = '/api/v1/auth/sign_in'
      
  
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
  
  

  context "when user is not authenticated" do

    subject { get '/api/v1/guesses/2' } 

    it "returns http status code" do
      subject  
      expect(response).to have_http_status(:unauthorized)  
    end
    
  end

  context "when user is authenticated" do

    context "and a guess with thing_type exists" do
      subject { get '/api/v1/guesses/2', headers: @headers } 
      before do 
        thing = create :thing, id: 12, name: "toys"
        thing_type = create :thing_type, id: 2, url: 'keme', thing: thing, name: "fruits"
        
      
        create :guess, id: 7, thing_type: thing_type, user: @user 

        
      end

      it "return proper guess data" do
        subject 

        
        json_data = JSON.parse(response.body)
        expect(json_data['guess']).to include({
          
          'thing_type_url' => 'keme'
        })  
      end
      
    end


    context "and a guess with thing_type does not exists" do
      subject { get '/api/v1/guesses/2', headers: @headers } 
      before do 
        thing = create :thing, id: 12, name: "fruits"
        thing_type = create :thing_type, id: 2, url: 'keme', thing: thing, name: "fruits"
        
      
  
      end

      it "return proper guess data" do
        subject 

        
        json_data = JSON.parse(response.body)
        expect(json_data['guess']).to include({
         
          'thing_type_url' => 'keme'
        })  
      end

      it "increment guess.count by 1" do

        expect{subject}.to change{Guess.count}.by(1)
        
      end
      
      
    end
    
    
  end
  
end

end
