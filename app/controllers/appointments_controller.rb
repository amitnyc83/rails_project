class AppointmentsController < ApplicationController
  before_action :login_required
  before_action :find_apppointment, except: [:index, :new, :create]


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



  def new
    @appointment = Appointment.new
    unless logged_in? && @current_physician
      flash[:notice] = "You must be a Physician to create an appointment"
      if !logged_in?
        redirect_to root_path
      else
        redirect_to patient_path(@current_patient)
     end
    end
  end


  def show
  end





  def create
    @appointment = Appointment.new(appointment_params)
    if @current_physician
     if @appointment.save
      flash[:notice] = "Appointment was successfully created"
      redirect_to appointment_path(@appointment)
     else
      flash[:notice] = "There was an error creating this appointment"
      render 'appointments/new'
    end
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
