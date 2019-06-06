require 'rails_helper'

RSpec.describe CocktailPhoto, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:photo_likes) }

    it { should have_many(:photo_comments) }

    it { should belong_to(:cocktail) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
