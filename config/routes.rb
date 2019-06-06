Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "venues#index"
  # Routes for the Photo like resource:

  # CREATE
  get("/photo_likes/new", { :controller => "photo_likes", :action => "new_form" })
  post("/create_photo_like", { :controller => "photo_likes", :action => "create_row" })

  # READ
  get("/photo_likes", { :controller => "photo_likes", :action => "index" })
  get("/photo_likes/:id_to_display", { :controller => "photo_likes", :action => "show" })

  # UPDATE
  get("/photo_likes/:prefill_with_id/edit", { :controller => "photo_likes", :action => "edit_form" })
  post("/update_photo_like/:id_to_modify", { :controller => "photo_likes", :action => "update_row" })

  # DELETE
  get("/delete_photo_like/:id_to_remove", { :controller => "photo_likes", :action => "destroy_row" })
  get("/delete_photo_like_from_user/:id_to_remove", { :controller => "photo_likes", :action => "destroy_row_from_user" })
  get("/delete_photo_like_from_photo/:id_to_remove", { :controller => "photo_likes", :action => "destroy_row_from_photo" })

  #------------------------------

  # Routes for the Photo comment resource:

  # CREATE
  get("/photo_comments/new", { :controller => "photo_comments", :action => "new_form" })
  post("/create_photo_comment", { :controller => "photo_comments", :action => "create_row" })

  # READ
  get("/photo_comments", { :controller => "photo_comments", :action => "index" })
  get("/photo_comments/:id_to_display", { :controller => "photo_comments", :action => "show" })

  # UPDATE
  get("/photo_comments/:prefill_with_id/edit", { :controller => "photo_comments", :action => "edit_form" })
  post("/update_photo_comment/:id_to_modify", { :controller => "photo_comments", :action => "update_row" })

  # DELETE
  get("/delete_photo_comment/:id_to_remove", { :controller => "photo_comments", :action => "destroy_row" })
  get("/delete_photo_comment_from_author/:id_to_remove", { :controller => "photo_comments", :action => "destroy_row_from_author" })
  get("/delete_photo_comment_from_photo/:id_to_remove", { :controller => "photo_comments", :action => "destroy_row_from_photo" })

  #------------------------------

  # Routes for the Venue like resource:

  # CREATE
  get("/venue_likes/new", { :controller => "venue_likes", :action => "new_form" })
  post("/create_venue_like", { :controller => "venue_likes", :action => "create_row" })

  # READ
  get("/venue_likes", { :controller => "venue_likes", :action => "index" })
  get("/venue_likes/:id_to_display", { :controller => "venue_likes", :action => "show" })

  # UPDATE
  get("/venue_likes/:prefill_with_id/edit", { :controller => "venue_likes", :action => "edit_form" })
  post("/update_venue_like/:id_to_modify", { :controller => "venue_likes", :action => "update_row" })

  # DELETE
  get("/delete_venue_like/:id_to_remove", { :controller => "venue_likes", :action => "destroy_row" })
  get("/delete_venue_like_from_user/:id_to_remove", { :controller => "venue_likes", :action => "destroy_row_from_user" })
  get("/delete_venue_like_from_venue/:id_to_remove", { :controller => "venue_likes", :action => "destroy_row_from_venue" })

  #------------------------------

  # Routes for the Venue comment resource:

  # CREATE
  get("/venue_comments/new", { :controller => "venue_comments", :action => "new_form" })
  post("/create_venue_comment", { :controller => "venue_comments", :action => "create_row" })

  # READ
  get("/venue_comments", { :controller => "venue_comments", :action => "index" })
  get("/venue_comments/:id_to_display", { :controller => "venue_comments", :action => "show" })

  # UPDATE
  get("/venue_comments/:prefill_with_id/edit", { :controller => "venue_comments", :action => "edit_form" })
  post("/update_venue_comment/:id_to_modify", { :controller => "venue_comments", :action => "update_row" })

  # DELETE
  get("/delete_venue_comment/:id_to_remove", { :controller => "venue_comments", :action => "destroy_row" })
  get("/delete_venue_comment_from_author/:id_to_remove", { :controller => "venue_comments", :action => "destroy_row_from_author" })
  get("/delete_venue_comment_from_venue/:id_to_remove", { :controller => "venue_comments", :action => "destroy_row_from_venue" })

  #------------------------------

  # Routes for the Follow request resource:

  # CREATE
  get("/follow_requests/new", { :controller => "follow_requests", :action => "new_form" })
  post("/create_follow_request", { :controller => "follow_requests", :action => "create_row" })

  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  get("/follow_requests/:id_to_display", { :controller => "follow_requests", :action => "show" })

  # UPDATE
  get("/follow_requests/:prefill_with_id/edit", { :controller => "follow_requests", :action => "edit_form" })
  post("/update_follow_request/:id_to_modify", { :controller => "follow_requests", :action => "update_row" })

  # DELETE
  get("/delete_follow_request/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row" })
  get("/delete_follow_request_from_recipient/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row_from_recipient" })
  get("/delete_follow_request_from_sender/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row_from_sender" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Cocktail photo resource:

  # CREATE
  get("/cocktail_photos/new", { :controller => "cocktail_photos", :action => "new_form" })
  post("/create_cocktail_photo", { :controller => "cocktail_photos", :action => "create_row" })

  # READ
  get("/cocktail_photos", { :controller => "cocktail_photos", :action => "index" })
  get("/cocktail_photos/:id_to_display", { :controller => "cocktail_photos", :action => "show" })

  # UPDATE
  get("/cocktail_photos/:prefill_with_id/edit", { :controller => "cocktail_photos", :action => "edit_form" })
  post("/update_cocktail_photo/:id_to_modify", { :controller => "cocktail_photos", :action => "update_row" })

  # DELETE
  get("/delete_cocktail_photo/:id_to_remove", { :controller => "cocktail_photos", :action => "destroy_row" })
  get("/delete_cocktail_photo_from_owner/:id_to_remove", { :controller => "cocktail_photos", :action => "destroy_row_from_owner" })
  get("/delete_cocktail_photo_from_cocktail/:id_to_remove", { :controller => "cocktail_photos", :action => "destroy_row_from_cocktail" })

  #------------------------------

  # Routes for the Cocktail resource:

  # CREATE
  get("/cocktails/new", { :controller => "cocktails", :action => "new_form" })
  post("/create_cocktail", { :controller => "cocktails", :action => "create_row" })

  # READ
  get("/cocktails", { :controller => "cocktails", :action => "index" })
  get("/cocktails/:id_to_display", { :controller => "cocktails", :action => "show" })

  # UPDATE
  get("/cocktails/:prefill_with_id/edit", { :controller => "cocktails", :action => "edit_form" })
  post("/update_cocktail/:id_to_modify", { :controller => "cocktails", :action => "update_row" })

  # DELETE
  get("/delete_cocktail/:id_to_remove", { :controller => "cocktails", :action => "destroy_row" })
  get("/delete_cocktail_from_venue/:id_to_remove", { :controller => "cocktails", :action => "destroy_row_from_venue" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  get("/venues/new", { :controller => "venues", :action => "new_form" })
  post("/create_venue", { :controller => "venues", :action => "create_row" })

  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:id_to_display", { :controller => "venues", :action => "show" })

  # UPDATE
  get("/venues/:prefill_with_id/edit", { :controller => "venues", :action => "edit_form" })
  post("/update_venue/:id_to_modify", { :controller => "venues", :action => "update_row" })

  # DELETE
  get("/delete_venue/:id_to_remove", { :controller => "venues", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
