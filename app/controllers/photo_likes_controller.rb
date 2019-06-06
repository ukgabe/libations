class PhotoLikesController < ApplicationController
  def index
    @photo_likes = PhotoLike.page(params[:page]).per(10)

    render("photo_like_templates/index.html.erb")
  end

  def show
    @photo_like = PhotoLike.find(params.fetch("id_to_display"))

    render("photo_like_templates/show.html.erb")
  end

  def new_form
    @photo_like = PhotoLike.new

    render("photo_like_templates/new_form.html.erb")
  end

  def create_row
    @photo_like = PhotoLike.new

    @photo_like.photo_id = params.fetch("photo_id")
    @photo_like.user_id = params.fetch("user_id")

    if @photo_like.valid?
      @photo_like.save

      redirect_back(:fallback_location => "/photo_likes", :notice => "Photo like created successfully.")
    else
      render("photo_like_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_cocktail_photo
    @photo_like = PhotoLike.new

    @photo_like.photo_id = params.fetch("photo_id")
    @photo_like.user_id = params.fetch("user_id")

    if @photo_like.valid?
      @photo_like.save

      redirect_to("/cocktail_photos/#{@photo_like.photo_id}", notice: "PhotoLike created successfully.")
    else
      render("photo_like_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @photo_like = PhotoLike.find(params.fetch("prefill_with_id"))

    render("photo_like_templates/edit_form.html.erb")
  end

  def update_row
    @photo_like = PhotoLike.find(params.fetch("id_to_modify"))

    @photo_like.photo_id = params.fetch("photo_id")
    @photo_like.user_id = params.fetch("user_id")

    if @photo_like.valid?
      @photo_like.save

      redirect_to("/photo_likes/#{@photo_like.id}", :notice => "Photo like updated successfully.")
    else
      render("photo_like_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_photo
    @photo_like = PhotoLike.find(params.fetch("id_to_remove"))

    @photo_like.destroy

    redirect_to("/cocktail_photos/#{@photo_like.photo_id}", notice: "PhotoLike deleted successfully.")
  end

  def destroy_row_from_user
    @photo_like = PhotoLike.find(params.fetch("id_to_remove"))

    @photo_like.destroy

    redirect_to("/users/#{@photo_like.user_id}", notice: "PhotoLike deleted successfully.")
  end

  def destroy_row
    @photo_like = PhotoLike.find(params.fetch("id_to_remove"))

    @photo_like.destroy

    redirect_to("/photo_likes", :notice => "Photo like deleted successfully.")
  end
end
