json.guess do 
    
    json.id @guess.id 
  
    json.thing_type_url @guess.thing_type.url

    json.words @guess.words do |word|
        json.(word, :id, :content)
    end

end