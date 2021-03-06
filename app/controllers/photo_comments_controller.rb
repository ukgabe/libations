class PhotoCommentsController < ApplicationController
  def index
    @q = PhotoComment.ransack(params[:q])
    @photo_comments = @q.result(:distinct => true).includes(:photo, :author).page(params[:page]).per(10)

    render("photo_comment_templates/index.html.erb")
  end

  def show
    @photo_comment = PhotoComment.find(params.fetch("id_to_display"))

    render("photo_comment_templates/show.html.erb")
  end

  def new_form
    @photo_comment = PhotoComment.new

    render("photo_comment_templates/new_form.html.erb")
  end

  def create_row
    @photo_comment = PhotoComment.new

    @photo_comment.author_id = params.fetch("author_id")
    @photo_comment.photo_id = params.fetch("photo_id")
    @photo_comment.body = params.fetch("body")

    if @photo_comment.valid?
      @photo_comment.save

      redirect_back(:fallback_location => "/photo_comments", :notice => "Photo comment created successfully.")
    else
      render("photo_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_cocktail_photo
    @photo_comment = PhotoComment.new

    @photo_comment.author_id = params.fetch("author_id")
    @photo_comment.photo_id = params.fetch("photo_id")
    @photo_comment.body = params.fetch("body")

    if @photo_comment.valid?
      @photo_comment.save

      redirect_to("/cocktail_photos/#{@photo_comment.photo_id}", notice: "PhotoComment created successfully.")
    else
      render("photo_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @photo_comment = PhotoComment.find(params.fetch("prefill_with_id"))

    render("photo_comment_templates/edit_form.html.erb")
  end

  def update_row
    @photo_comment = PhotoComment.find(params.fetch("id_to_modify"))

    @photo_comment.author_id = params.fetch("author_id")
    @photo_comment.photo_id = params.fetch("photo_id")
    @photo_comment.body = params.fetch("body")

    if @photo_comment.valid?
      @photo_comment.save

      redirect_to("/photo_comments/#{@photo_comment.id}", :notice => "Photo comment updated successfully.")
    else
      render("photo_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_photo
    @photo_comment = PhotoComment.find(params.fetch("id_to_remove"))

    @photo_comment.destroy

    redirect_to("/cocktail_photos/#{@photo_comment.photo_id}", notice: "PhotoComment deleted successfully.")
  end

  def destroy_row_from_author
    @photo_comment = PhotoComment.find(params.fetch("id_to_remove"))

    @photo_comment.destroy

    redirect_to("/users/#{@photo_comment.author_id}", notice: "PhotoComment deleted successfully.")
  end

  def destroy_row
    @photo_comment = PhotoComment.find(params.fetch("id_to_remove"))

    @photo_comment.destroy

    redirect_to("/photo_comments", :notice => "Photo comment deleted successfully.")
  end
end
