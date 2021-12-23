json.user do 

    json.(@user, :id, :name)
    json.favourite_things @user.favourite_things.includes(:thing) do |favourite_thing| 
       
        json.id favourite_thing.id
        json.name favourite_thing.name 
        json.img favourite_thing.thing.img
        json.slug favourite_thing.thing.slug

    end

end