json.thing do 

    json.(@thing, :id, :img, :name)
    json.thing_types @thing.thing_types.includes(:thing) do |thing_type| 
       
        json.(thing_type, :id, :url)
    end

end