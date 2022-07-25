json.extract! user, :id, :name, :mobile, :email, :batch, :profile_pic, :created_at, :updated_at
json.url user_url(user, format: :json)
