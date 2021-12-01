json.user do 

    json.(@user, :id, :name)
    json.favourite_things @user.favourite_things do |favourite_thing| 
        json.(favourite_thing, :id, :name)

    end

end