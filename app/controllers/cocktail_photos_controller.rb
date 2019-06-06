class CocktailPhotosController < ApplicationController
  def index
    @cocktail_photos = CocktailPhoto.page(params[:page]).per(10)

    render("cocktail_photo_templates/index.html.erb")
  end

  def show
    @photo_like = PhotoLike.new
    @photo_comment = PhotoComment.new
    @cocktail_photo = CocktailPhoto.find(params.fetch("id_to_display"))

    render("cocktail_photo_templates/show.html.erb")
  end

  def new_form
    @cocktail_photo = CocktailPhoto.new

    render("cocktail_photo_templates/new_form.html.erb")
  end

  def create_row
    @cocktail_photo = CocktailPhoto.new

    @cocktail_photo.image = params.fetch("image") if params.key?("image")
    @cocktail_photo.caption = params.fetch("caption")
    @cocktail_photo.owner_id = params.fetch("owner_id")
    @cocktail_photo.cocktail_id = params.fetch("cocktail_id")
    @cocktail_photo.comment_count = params.fetch("comment_count")
    @cocktail_photo.likes_count = params.fetch("likes_count")

    if @cocktail_photo.valid?
      @cocktail_photo.save

      redirect_back(:fallback_location => "/cocktail_photos", :notice => "Cocktail photo created successfully.")
    else
      render("cocktail_photo_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_cocktail
    @cocktail_photo = CocktailPhoto.new

    @cocktail_photo.image = params.fetch("image") if params.key?("image")
    @cocktail_photo.caption = params.fetch("caption")
    @cocktail_photo.owner_id = params.fetch("owner_id")
    @cocktail_photo.cocktail_id = params.fetch("cocktail_id")
    @cocktail_photo.comment_count = params.fetch("comment_count")
    @cocktail_photo.likes_count = params.fetch("likes_count")

    if @cocktail_photo.valid?
      @cocktail_photo.save

      redirect_to("/cocktails/#{@cocktail_photo.cocktail_id}", notice: "CocktailPhoto created successfully.")
    else
      render("cocktail_photo_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @cocktail_photo = CocktailPhoto.find(params.fetch("prefill_with_id"))

    render("cocktail_photo_templates/edit_form.html.erb")
  end

  def update_row
    @cocktail_photo = CocktailPhoto.find(params.fetch("id_to_modify"))

    @cocktail_photo.image = params.fetch("image") if params.key?("image")
    @cocktail_photo.caption = params.fetch("caption")
    @cocktail_photo.owner_id = params.fetch("owner_id")
    @cocktail_photo.cocktail_id = params.fetch("cocktail_id")
    @cocktail_photo.comment_count = params.fetch("comment_count")
    @cocktail_photo.likes_count = params.fetch("likes_count")

    if @cocktail_photo.valid?
      @cocktail_photo.save

      redirect_to("/cocktail_photos/#{@cocktail_photo.id}", :notice => "Cocktail photo updated successfully.")
    else
      render("cocktail_photo_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_cocktail
    @cocktail_photo = CocktailPhoto.find(params.fetch("id_to_remove"))

    @cocktail_photo.destroy

    redirect_to("/cocktails/#{@cocktail_photo.cocktail_id}", notice: "CocktailPhoto deleted successfully.")
  end

  def destroy_row_from_owner
    @cocktail_photo = CocktailPhoto.find(params.fetch("id_to_remove"))

    @cocktail_photo.destroy

    redirect_to("/users/#{@cocktail_photo.owner_id}", notice: "CocktailPhoto deleted successfully.")
  end

  def destroy_row
    @cocktail_photo = CocktailPhoto.find(params.fetch("id_to_remove"))

    @cocktail_photo.destroy

    redirect_to("/cocktail_photos", :notice => "Cocktail photo deleted successfully.")
  end
end
