json.thing do 

    json.(@thing, :id, :img, :name)
    json.total_thing_types @thing.thing_types.size
    json.thing_types @thing_types.includes(:thing) do |thing_type| 
       
        json.(thing_type, :id, :url)
    end

end