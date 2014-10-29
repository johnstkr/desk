require 'rails_helper'

RSpec.describe Case, :type => :model do

  CASE_ID = 4 #this is the test case

  describe "find" do
    before do
      @case = Case.find(CASE_ID)
    end

    it "returns a case" do
      expect(@case.class).to eq Case
    end

    it "has a subject" do
      expect(@case.subject.class).to_not eq nil
    end

    it "has a type" do
      expect(["chat", "twitter", "email", "qna", "facebook", "phone"]).to include @case.type
    end

    it "has an id" do
      expect(@case.id).to eq CASE_ID
    end

    it "has a status" do
      expect(["new", "open", "pending", "resolved", "closed"]).to include @case.status
    end

    it "has a description" do
      expect(@case.description).to_not eq nil
    end
  end

  describe "list" do
    before do
      @cases = Case.list
    end

    it "returns an array" do
      expect(@cases.class).to eq Array
    end

    it "returns an array of Cases" do
      expect(@cases[0].class).to eq Case
    end
  end

  describe "labels" do
    before do
      @case = Case.find(CASE_ID)
      @labels = @case.get_labels
    end

    it "returns an array" do
      expect(@labels.class).to eq Array
    end

    it "returns an array of labels" do
      expect(@labels[0].class).to eq Label
    end
  end
end
