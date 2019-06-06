class VenueCommentsController < ApplicationController
  def index
    @venue_comments = VenueComment.page(params[:page]).per(10)

    render("venue_comment_templates/index.html.erb")
  end

  def show
    @venue_comment = VenueComment.find(params.fetch("id_to_display"))

    render("venue_comment_templates/show.html.erb")
  end

  def new_form
    @venue_comment = VenueComment.new

    render("venue_comment_templates/new_form.html.erb")
  end

  def create_row
    @venue_comment = VenueComment.new

    @venue_comment.author_id = params.fetch("author_id")
    @venue_comment.venue_id = params.fetch("venue_id")
    @venue_comment.body = params.fetch("body")

    if @venue_comment.valid?
      @venue_comment.save

      redirect_back(:fallback_location => "/venue_comments", :notice => "Venue comment created successfully.")
    else
      render("venue_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_venue
    @venue_comment = VenueComment.new

    @venue_comment.author_id = params.fetch("author_id")
    @venue_comment.venue_id = params.fetch("venue_id")
    @venue_comment.body = params.fetch("body")

    if @venue_comment.valid?
      @venue_comment.save

      redirect_to("/venues/#{@venue_comment.venue_id}", notice: "VenueComment created successfully.")
    else
      render("venue_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @venue_comment = VenueComment.find(params.fetch("prefill_with_id"))

    render("venue_comment_templates/edit_form.html.erb")
  end

  def update_row
    @venue_comment = VenueComment.find(params.fetch("id_to_modify"))

    @venue_comment.author_id = params.fetch("author_id")
    @venue_comment.venue_id = params.fetch("venue_id")
    @venue_comment.body = params.fetch("body")

    if @venue_comment.valid?
      @venue_comment.save

      redirect_to("/venue_comments/#{@venue_comment.id}", :notice => "Venue comment updated successfully.")
    else
      render("venue_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_venue
    @venue_comment = VenueComment.find(params.fetch("id_to_remove"))

    @venue_comment.destroy

    redirect_to("/venues/#{@venue_comment.venue_id}", notice: "VenueComment deleted successfully.")
  end

  def destroy_row_from_author
    @venue_comment = VenueComment.find(params.fetch("id_to_remove"))

    @venue_comment.destroy

    redirect_to("/users/#{@venue_comment.author_id}", notice: "VenueComment deleted successfully.")
  end

  def destroy_row
    @venue_comment = VenueComment.find(params.fetch("id_to_remove"))

    @venue_comment.destroy

    redirect_to("/venue_comments", :notice => "Venue comment deleted successfully.")
  end
end
