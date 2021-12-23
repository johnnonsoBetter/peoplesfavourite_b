json.array! @favourite_things do |favourite_thing|
    
    json.id favourite_thing.id
    json.name favourite_thing.name 
    json.img favourite_thing.thing.img
    json.slug favourite_thing.slug
end