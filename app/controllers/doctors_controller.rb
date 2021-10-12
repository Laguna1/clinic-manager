class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[edit update show destroy]

  def index
    @doctors = Doctor.all.order('created_at ASC')
  end

  def show; end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render 'new'
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor)
    else
      render 'edit'
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:firstname, :lastname, :phone_number, :email, :speciality)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
