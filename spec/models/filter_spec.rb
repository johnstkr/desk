require 'rails_helper'

RSpec.describe Filter, :type => :model do

  FILTER_ID = "2172115" #this is the test filter

  describe "find" do
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

  describe "list" do
    before do
      @filters = Filter.list
    end

    it "returns an array" do
      expect(@filters.class).to eq Array
    end

    it "returns an array of Filters" do
      expect(@filters[0].class).to eq Filter
    end

  end

  describe "cases" do
    before do
      @filter = Filter.find(FILTER_ID)
      @cases = @filter.cases
    end

    it "returns an array" do
      expect(@cases.class).to eq Array
    end

    it "returns an array of cases" do
      expect(@cases[0].class).to eq Case

    end

  end
end
