class VenueLikesController < ApplicationController
  def index
    @venue_likes = VenueLike.all

    render("venue_like_templates/index.html.erb")
  end

  def show
    @venue_like = VenueLike.find(params.fetch("id_to_display"))

    render("venue_like_templates/show.html.erb")
  end

  def new_form
    @venue_like = VenueLike.new

    render("venue_like_templates/new_form.html.erb")
  end

  def create_row
    @venue_like = VenueLike.new

    @venue_like.user_id = params.fetch("user_id")
    @venue_like.venue_id = params.fetch("venue_id")

    if @venue_like.valid?
      @venue_like.save

      redirect_back(:fallback_location => "/venue_likes", :notice => "Venue like created successfully.")
    else
      render("venue_like_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @venue_like = VenueLike.find(params.fetch("prefill_with_id"))

    render("venue_like_templates/edit_form.html.erb")
  end

  def update_row
    @venue_like = VenueLike.find(params.fetch("id_to_modify"))

    @venue_like.user_id = params.fetch("user_id")
    @venue_like.venue_id = params.fetch("venue_id")

    if @venue_like.valid?
      @venue_like.save

      redirect_to("/venue_likes/#{@venue_like.id}", :notice => "Venue like updated successfully.")
    else
      render("venue_like_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_venue
    @venue_like = VenueLike.find(params.fetch("id_to_remove"))

    @venue_like.destroy

    redirect_to("/venues/#{@venue_like.venue_id}", notice: "VenueLike deleted successfully.")
  end

  def destroy_row_from_user
    @venue_like = VenueLike.find(params.fetch("id_to_remove"))

    @venue_like.destroy

    redirect_to("/users/#{@venue_like.user_id}", notice: "VenueLike deleted successfully.")
  end

  def destroy_row
    @venue_like = VenueLike.find(params.fetch("id_to_remove"))

    @venue_like.destroy

    redirect_to("/venue_likes", :notice => "Venue like deleted successfully.")
  end
end
