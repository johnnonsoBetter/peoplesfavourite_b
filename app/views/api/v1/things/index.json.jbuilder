json.array! @things do |thing| 

    favourite_thing = current_api_v1_user.favourite_things.find_by_thing_id(thing.id)
    favourite_thing_id = nil

    favourite_thing_id = favourite_thing.id if favourite_thing


    json.id thing.id 
    json.name thing.name
    json.img thing.img
    json.added @user_fav_ids.include?(thing.id)
    json.favourite_thing_id favourite_thing_id
    

    
    

end


