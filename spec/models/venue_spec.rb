require 'rails_helper'

RSpec.describe Venue, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:venue_likes) }

    it { should have_many(:venue_comments) }

    it { should have_many(:cocktails) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
