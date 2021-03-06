require 'rails_helper'

RSpec.describe Label, :type => :model do
  LABEL_ID = 2025755 #this is the test label

  describe "find" do
    before do
      @label = Label.find(LABEL_ID)
    end

    it "returns a Label" do
      expect(@label.class).to eq Label
    end

    it "has a name" do
      expect(@label.name).to include "Test"
    end

    it "has a color" do
      expect(["default", "blue", "white", "yellow", "red", "orange", "green", "black", "purple", "brown", "grey", "pink"]).to include @label.color
    end

    it "has an id" do
      expect(@label.id).to eq LABEL_ID
    end
  end

  describe "list" do
    before do
      @labels = Label.list
    end

    it "returns an array" do
      expect(@labels.class).to eq Array
    end

    it "returns an array of labels" do
      expect(@labels[0].class).to eq Label
    end
  end

end
