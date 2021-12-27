class Api::V1::WordsController < ApplicationController
    before_action :authenticate_api_v1_user!, only: :create

    def create 


        @guess = Guess.find_by_id(params[:guess_id])
        to_guess = words_for @guess.thing_type.name
        @score = 0
        word_to_create = []


        #get all my previous guessed words.
        prev_guessed = @guess.words.map{|w| w.content.downcase}
        

        #extract all words that i have not guessed from against my new guess and all my previous guess.
        compared_guess = (words_for params[:content]) - prev_guessed

        
        #create record of the correctly guessed word extracted.
        Word.transaction(requires_new: true) do 
            Guess.transaction(requires_new: true) do 

                compared_guess.each do |guess|

                    if to_guess.include?(guess) 
                        raise ActiveRecord::Rollback if !@guess.words.create content: guess
                        @score += 1
                    end
    
                end



            end

            #update the attribute completed of the guess when user has succesfully completed all guess words 
            @guess.toggle!(:completed) if completed_guess? (to_guess - @guess.words.map{|w| w.content.downcase}) 

            

        end

        


        render 'api/v1/words/create.json.jbuilder', status: :created


        

    end



    private 

    def words_for(word)
        word.downcase.split(" ")
    end

    def completed_guess?(all_guess)
        all_guess.empty?
    end
end
