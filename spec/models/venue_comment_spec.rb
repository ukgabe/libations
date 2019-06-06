require 'rails_helper'

RSpec.describe VenueComment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:author) }

    it { should belong_to(:venue) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
