Rails.application.routes.draw do
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
