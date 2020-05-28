Rails.application.routes.draw do
  get("/users", {:controller => "users" , :action => "index"})
  get("users/")
  get("/photos", {:controller => "photos" , :action => "index"})
  get("/photos/:photo_id", {:controler => "photos", :action => "details"})
  
end
