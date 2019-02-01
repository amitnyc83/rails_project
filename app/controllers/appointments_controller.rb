class AppointmentsController < ApplicationController
  before_action :login_required
  before_action :find_appointment, except: [:index, :new, :create]


  def index
    if @current_patient == Patient.friendly.find(params[:patient_id])
      @appointments = @current_patient.appointments
    elsif @current_physician
      @appointments = @current_physician.appointments
    else
      flash[:notice] = "You are not allowed to view this page! "
      redirect_to root_path
    end
  end

  def show
    if @current_patient
      unless @current_patient == @appointment.patient
        flash[:notice] = "Only the Physician and Patient of this appointment can view this page"
        redirect_to appointments_path
      end
    elsif @current_physician
      unless @current_physician == @appointment.physician
        flash[:notice] = "Only the Physician and Patient of this appointment can view this page"
        redirect_to appointments_path
      end
    else
      flash[:notice] = "You have to be logged in to view this page"
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
    else
      flash[:notice] = "Only Physician's can create appointment"
      redirect_to patient_path(@current_patient)
    end
  end


  def edit
    if @current_physician
      unless @current_physician == @appointment.physician
        flash[:notice] = "You cannot edit this appointment"
        redirect_to appointments_path(@appointment)
      end
    elsif @current_patient
      unless @current_patient == @appointment.patient
        flash[:notice] = "You cannot edit this appointment"
        redirect_to appointments_path
      end
    end
  end


  def update
    if @current_patient
      if @current_patient == @appointment.patient
        if @appointment.update(appointment_params)
          flash[:notice] = "Appointment was successfully updated"
          redirect_to appointment_path(@appointment)
        else
          flash[:notice] = "Appointment was not updated. There was asn Error."
          render edit_appointment_path(@appointment)
        end
      else
        flash[:notice] = "You cannot edit this appointment"
        redirect_to appointments_path
      end
    elsif @current_physician
      if @current_physician == @appointment.physician
        if @appointment.update(appointment_params)
          flash[:notice] = "Appointment was successfully updated"
          redirect_to appointment_path(@appointment)
        else
          flash[:notice] = "Appointment was not updated. There was asn Error."
          render edit_appointment_path(@appointment)
        end
      else
        flash[:notice] = "You cannot edit this appointment"
        redirect_to appointments_path
      end
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
