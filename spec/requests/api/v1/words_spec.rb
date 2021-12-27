require 'rails_helper'

RSpec.describe "Api::V1::Words", type: :request do
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


  describe "POST #create" do
  

    before do 
      thing = create :thing, name: "toys"
      thing_type = create :thing_type, name: "toys brick game", thing: thing
      guess = create :guess, id: 6, user: @user, thing_type: thing_type
      @word_params = {
        guess_id: 6,
        content: "toys is opener"
      }

      @words_url = '/api/v1/words'
    end

    context "when user is not authenticated" do
      subject { post @words_url, params: @word_params } 
      it "returns http status unauthorized" do
        subject
        expect(response).to have_http_status(:unauthorized)  
      end
      
    end

    context "when user is authenticated " do
      
      context "and user got only two word correctly and the two word was all there is left to guess" do
        subject { post @words_url, params: {guess_id: 6, content: "toys brick"}, headers: @headers } 

        before do 

          create :word, guess_id: 6, content: "game"

        end

        it "returns http status :created" do
          subject
          expect(response).to have_http_status(:created) 
        end

        it "increments Word.count by 1" do
           
          expect{
            subject
          }.to change{Word.count}.by(2)
        end

        it "changes the completed guess attribute to true" do
          subject
          expect(Guess.find(6).completed).to eq(true)  
        end
        

        it "returns proper data of guess " do
          subject 
          json_data = JSON.parse(response.body)

          expect(json_data).to include({
            'score' => 2
          })  

        end
        
        
        
      end


      context "and user got all word correctly" do
        subject { post @words_url, params: {guess_id: 6, content: "toys milk shake"}, headers: @headers } 

        it "returns http status :created" do
          subject
          expect(response).to have_http_status(:created) 
        end

        it "increments Word.count by 1" do
           
          expect{
            subject
          }.to change{Word.count}.by(1)
        end

        it "returns proper data of guess " do
          subject 
          json_data = JSON.parse(response.body)

          expect(json_data).to include({
            'score' => 1
          })  

        end
        
        
        
      end
      
    end
    
    
  end
  

end
