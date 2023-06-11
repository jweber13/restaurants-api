json.extract! @restaurant, :id, :name, :address
json.comments @restaurant.comments do |comment|
  json.extract! comment, :id, :content
  json.user do
    json.username comment.user.username
    # json.id comment.user.id
    # json.email comment.user.email
  end
end
