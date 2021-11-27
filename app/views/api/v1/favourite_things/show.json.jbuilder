json.favourite_thing  do 

    json.(@favourite_thing, :id, :name)
    
end

json.favourite_thing_types @favourite_thing.favourite_thing_types do |favourite_type|
    json.(favourite_type, :id, :name)

end
