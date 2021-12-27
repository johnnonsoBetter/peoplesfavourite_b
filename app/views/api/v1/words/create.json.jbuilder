json.set! :score, @score
json.set! :total_score, @guess.user.score

json.guess do 
    
    json.id @guess.id 
    json.completed @guess.completed
    json.thing_type_url @guess.thing_type.url

    json.words @guess.words do |word|
        json.(word, :id, :content)
    end

end