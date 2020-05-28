Rails.application.routes.draw do
  get("/", {:controller => "users" , :action => "index"})

  get("/users", {:controller => "users" , :action => "index"})
  get("/users/:username", {:controller => "users" , :action => "details"})
  get("/insert_user_record", {:controller => "users" , :action => "add_row"})

  get("/photos", {:controller => "photos" , :action => "index"})
  get("/photos/:a_photo_id", {:controller => "photos", :action => "details"})
  get("/insert_photo_record", {:controller => "photos" , :action => "add_row"})
  
  get("/insert_comment_record", {:controller => "comments" , :action => "add_row"})
end
