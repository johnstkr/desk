require 'rails_helper'

RSpec.describe FiltersController, :type => :controller do
  describe "index" do
    before do
      get :index
    end
    it "populates an array of filters" do
      expect(assigns(:filters).class).to eq Array
    end
    it "renders the :index view" do
      response.should render_template :index
    end
  end

  describe "show" do
    before do
      get :show, id: 2172115
    end
    it "populates an array of cases" do
      expect(assigns(:cases).class).to eq Array
    end
    it "renders the cases view" do
      response.should render_template "filters/_cases"
    end
  end
end
