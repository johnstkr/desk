class LabelsController < ApplicationController
  def create
    @label = Label.create(label_params)

    kase = Case.find(params[:case])
    kase.add_label @label
    render :partial => "labels/create"
  end

  private
    def label_params
      params.permit(:name, :color, :description)
    end
end
