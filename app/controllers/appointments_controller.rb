class AppointmentsController < ApplicationController
    before_action :set_appointment, only: %i[edit update show destroy]

    def index
      @appointments = Appointment.all.order('created_at ASC')
    end
  
    def show; end
  
    def new
      @appointment = Appointment.new
    end
  
    def create
      @appointment = Appointment.new(appointment_params)
      if @appointment.save
        redirect_to appointment_path(@appointment)
      else
        render 'new'
      end
    end
  
    def destroy
      @appointment.destroy
      redirect_to root_path
    end
  
    def update
      if @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
      else
        render 'edit'
      end
    end
  
    private
  
    def appointment_params
      params.require(:appointment).permit(:appointment_date, :patient_id, :doctor_id, :from_doctor, :body)
    end
  
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
end
