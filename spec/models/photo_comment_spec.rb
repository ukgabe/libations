require 'rails_helper'

RSpec.describe PhotoComment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:photo) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
