class FiltersController < ApplicationController
  def index
    @filters = Filter.list
  end

  def show
    @filter = Filter.find(params["id"])
    @cases = @filter.cases

    render :partial => "filters/cases"
  end
end
