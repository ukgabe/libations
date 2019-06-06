class VenuesController < ApplicationController
  def index
    @q = Venue.ransack(params[:q])
    @venues = @q.result(:distinct => true).includes(:cocktails, :venue_comments, :venue_likes).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@venues.where.not(:address_latitude => nil)) do |venue, marker|
      marker.lat venue.address_latitude
      marker.lng venue.address_longitude
      marker.infowindow "<h5><a href='/venues/#{venue.id}'>#{venue.name}</a></h5><small>#{venue.address_formatted_address}</small>"
    end

    render("venue_templates/index.html.erb")
  end

  def show
    @venue_like = VenueLike.new
    @venue_comment = VenueComment.new
    @cocktail = Cocktail.new
    @venue = Venue.find(params.fetch("id_to_display"))

    render("venue_templates/show.html.erb")
  end

  def new_form
    @venue = Venue.new

    render("venue_templates/new_form.html.erb")
  end

  def create_row
    @venue = Venue.new

    @venue.name = params.fetch("name")
    @venue.address = params.fetch("address")
    @venue.comment_count = params.fetch("comment_count")
    @venue.likes_count = params.fetch("likes_count")
    @venue.photo = params.fetch("photo") if params.key?("photo")
    @venue.description = params.fetch("description")

    if @venue.valid?
      @venue.save

      redirect_back(:fallback_location => "/venues", :notice => "Venue created successfully.")
    else
      render("venue_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @venue = Venue.find(params.fetch("prefill_with_id"))

    render("venue_templates/edit_form.html.erb")
  end

  def update_row
    @venue = Venue.find(params.fetch("id_to_modify"))

    @venue.name = params.fetch("name")
    @venue.address = params.fetch("address")
    @venue.comment_count = params.fetch("comment_count")
    @venue.likes_count = params.fetch("likes_count")
    @venue.photo = params.fetch("photo") if params.key?("photo")
    @venue.description = params.fetch("description")

    if @venue.valid?
      @venue.save

      redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
    else
      render("venue_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @venue = Venue.find(params.fetch("id_to_remove"))

    @venue.destroy

    redirect_to("/venues", :notice => "Venue deleted successfully.")
  end
end
