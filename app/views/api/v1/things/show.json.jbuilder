json.thing do 

    json.(@thing, :id, :img, :name)
    json.total_thing_types @thing.thing_types.size
    json.thing_types @thing_types.includes(:thing) do |thing_type| 
 
        json.id thing_type.id
        json.url thing_type.url 
        json.liked current_api_v1_user.liked? thing_type
        json.total_likes thing_type.get_likes.size
    end

end