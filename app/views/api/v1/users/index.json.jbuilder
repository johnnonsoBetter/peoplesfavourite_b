json.array! @users do |user|

    json.slug user.slug
    json.name user.name
    json.total_fav user.favourite_things.size
end