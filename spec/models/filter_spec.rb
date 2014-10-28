require 'rails_helper'
require 'desk'

RSpec.describe Filter, :type => :model do

  FILTER_ID = "2172115" #this is the test filter

  context "find" do
    before do
      @filter = Filter.find(FILTER_ID)
    end

    it "returns a filter" do
      expect(@filter.class).to eq Filter
    end

    it "has a name" do
      expect(@filter.name).to eq "Test Filter"
    end

    it "has an id" do
      expect(@filter.id).to eq FILTER_ID
    end
  end
end
