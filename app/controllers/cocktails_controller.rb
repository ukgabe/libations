class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all

    render("cocktail_templates/index.html.erb")
  end

  def show
    @cocktail = Cocktail.find(params.fetch("id_to_display"))

    render("cocktail_templates/show.html.erb")
  end

  def new_form
    @cocktail = Cocktail.new

    render("cocktail_templates/new_form.html.erb")
  end

  def create_row
    @cocktail = Cocktail.new

    @cocktail.name = params.fetch("name")
    @cocktail.ingredients = params.fetch("ingredients")
    @cocktail.likes_count = params.fetch("likes_count")
    @cocktail.comment_count = params.fetch("comment_count")
    @cocktail.venue_id = params.fetch("venue_id")

    if @cocktail.valid?
      @cocktail.save

      redirect_back(:fallback_location => "/cocktails", :notice => "Cocktail created successfully.")
    else
      render("cocktail_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @cocktail = Cocktail.find(params.fetch("prefill_with_id"))

    render("cocktail_templates/edit_form.html.erb")
  end

  def update_row
    @cocktail = Cocktail.find(params.fetch("id_to_modify"))

    @cocktail.name = params.fetch("name")
    @cocktail.ingredients = params.fetch("ingredients")
    @cocktail.likes_count = params.fetch("likes_count")
    @cocktail.comment_count = params.fetch("comment_count")
    @cocktail.venue_id = params.fetch("venue_id")

    if @cocktail.valid?
      @cocktail.save

      redirect_to("/cocktails/#{@cocktail.id}", :notice => "Cocktail updated successfully.")
    else
      render("cocktail_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @cocktail = Cocktail.find(params.fetch("id_to_remove"))

    @cocktail.destroy

    redirect_to("/cocktails", :notice => "Cocktail deleted successfully.")
  end
end
