require 'rails_helper'

RSpec.describe CasesController, :type => :controller do
  describe "show" do
    before do
      get :show, id: 2172115
    end
    it "populates an array of labels" do
      expect(assigns(:cases).class).to eq Array
    end
    it "renders the cases view" do
      response.should render_template "cases/_labels"
    end
  end
end
