require 'rails_helper'

RSpec.describe Cocktail, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:cocktail_photos) }

    it { should belong_to(:venue) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
