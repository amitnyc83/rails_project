class PatientsController < ApplicationController
before_action :login_required, except: [:index, :show, :new, :create]
before_action :find_patient, except: [:new, :create]


  def show
   if @current_patient = @patient
    @appointments = Appointment.where("patient_id = ?", @current_patient.id)
   else
     if @current_physician
      redirect_to physician_path(@current_physician)
     elsif @current_patient
      redirect_to patient_path(@current_patient)
     else
      redirect_to root_path
    end
   end
  end


  def new
    if @current_physician
      redirect_to physician_path(@current_physician)
    elsif @current_patient
      redirect_to patient_path(@current_patient)
    end
    @patient = Patient.new
  end




  def create
    @patient = Patient.new(patient_params)

    if @current_patient
      flash[:notice] = "You have an account in AppointmentMD"
      redirect_to patient_path(@current_patient)
    elsif @current_physician
      flash[:notice] = "A Physician cannot create a Patient account"
      redirect_to patient_path(@patient)
    end

    if @patient.save
      login_patient(@patient)
      flash[:notice] = "You have successfully created an account"
      redirect_to patient_path(@patient)
    else
      flash[:notice] = "There was an error "
      render "patients/new"
  end
end


def edit
  if @current_patient
    unless current_patient == @patient
      redirect_to patient_path(@current_patient)
    end
  elsif @current_physician
    redirect_to physician_path(@current_physician)
  else
    redirect_to root_path
  end
end


  def update
    if @current_patient
      if @current_patient == @patient
        if @patient.update(patient_params)
          flash[:notice] = "Your info was successfully updated"
          redirect_to patient_path(@patient)
        else
          flash[:notice] = "Your info was not updated"
          render :new
        end
      else
        flash[:notice] = "You cannot edit another Patients info"
      end
    else
      flash[:notice] = "You cannot edit a Patients info"
    end
  end


  private


  def patient_params
    params.require(:patient).permit(:name, :email, :password, :age, :date_of_birth)
  end


  def find_patient
    @patient = Patient.friendly.find(params[:id])
  end


end
