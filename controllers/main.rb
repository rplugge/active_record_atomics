get "/home" do
  if session[:id]
    erb :"welcome"
  else 
    erb :"homepage"
  end
end

get "/new_user" do
  erb :"new_user_form"
end

get "/save_user" do
  user_password = params["user"]["password"]
  user_password = BCrypt::Password.create(user_password)
end

get "/view_all_photos" do
  erb :"view_all_photos"
end

get "/album/:id" do
  erb :"album_photos"
end