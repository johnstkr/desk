class LabelsController < ApplicationController
  def create
    @label = Label.create(params["name"], params['description'], ["case", "macro"], params["color"])

    kase = Case.find(params["case"])
    kase.add_label @label
    render :partial => "labels/create"
  end
end
