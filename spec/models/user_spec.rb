require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:photo_likes) }

    it { should have_many(:cocktail_photos) }

    it { should have_many(:photo_comments) }

    it { should have_many(:venue_likes) }

    it { should have_many(:venue_comments) }

    it { should have_many(:follow_requests) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
