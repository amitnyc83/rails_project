class AppointmentsController < ApplicationController
  before_action :login_required
  before_action :find_apppointment, exccept: [:index, :new, :create]



  def new
    @appointment = Appointment.new
  end


  def show
    find_appointment
  end


  def index
    @appointments = Appointments.all
  end


  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render 'appointment/new'
    end
  end


  def edit
  end


  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render edit_appointment_path(@appointment)
    end
  end


  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :patient_id, :physician_id)
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

end
