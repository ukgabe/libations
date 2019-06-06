Rails.application.routes.draw do
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
