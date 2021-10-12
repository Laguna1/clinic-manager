class PatientsController < ApplicationController
  before_action :set_patient, only: %i[edit update show destroy]

  def index
    @patients = Patient.all.order('created_at ASC')
  end

  def show; end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end

  def destroy
    @patient.destroy
    redirect_to root_path
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:firstname, :lastname, :phone_number, :email, :address)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
