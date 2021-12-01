json.array! @favourite_things do |favourite_thing|

    json.(favourite_thing, :id, :name, :photo)

end