class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all.includes(:ordered_docvisits, :users)
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])
  end
  
end
