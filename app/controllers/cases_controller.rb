class CasesController < ApplicationController
  def show
    @case = Case.find(params["id"])
    @current_labels = @case.labels
    @labels = Label.list
    render :partial => "cases/labels"
  end

  def update
    kase = Case.find(params["id"])
    @label = Label.find(params["label"])
    kase.add_label(@label)
    render :partial => "labels/create"

  end
end
