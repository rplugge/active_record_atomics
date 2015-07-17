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

get "/add_photo" do
  erb :"add_photo"
end

get "/save_photo" do
  photo = Photo.create({photographer_id: params["photo"]["photographer_id"].to_i, url: params["photo"]["url"]})
  
  params["albums"].each do |album|
    album = Album.find(album.to_i)
    photo.albums<<album
  end
  
  erb :"success"
end

get "/photographer/:id" do
  erb :"photographer_photos"
end