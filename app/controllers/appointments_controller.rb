class AppointmentsController < ApplicationController
  before_action :login_required
  before_action :find_apppointment, except: [:index, :new, :create]



  def new
    @appointment = Appointment.new
  end


  def show
  end


  def index
    if @current_patient
      @appointments = Appointment.where("patient_id", @current_patient.id)
    elsif @current_physician
      @appointments = Appointment.where("physician_id", @current_physician.id)
    else
      flash[:notice] = "You need to log in to view this page"
      redirect_to root_path
    end
  end


  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render 'appointments/new'
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
