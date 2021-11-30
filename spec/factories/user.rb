FactoryBot.define do 
    factory :user do 
        name {"john"}
        email {"paul 300"}
        password {"password"}
        # slug {SecureRandom.alphanumeric(9)}
    end
end