json.array! @shops do |shop|
  json.id             shop.id
  json.name           shop.name
  json.introduction   shop.introduction
  json.location       shop.location
  json.open_time      shop.open_time
  json.close_time     shop.close_time
  json.url            shop.url
  json.tel            shop.tel
  json.image          shop.image
end
