class PatientsController < ApplicationController
 before_action :find_patient, only: [:show, :edit, :update]


  def index
    @patients = Patient.all
  end


  def new
    @patient = Patient.new
  end

  def show
    @appointments = Appointment.where("patient_id = ?", @patient.id)
  end


  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:notice] = "You have successfully created an account"
      redirect_to patient_path(@patient)
    else
      flash[:notice] = "Ther was an error "
  end
end 


  def edit
  end


  def update
  end


  private

  def find_patient
    @patient = Patient.find(params[:id])
  end


  def patient_params
    params.require(:patient).permit(:name, :age, :password_digest, :email, :date_of_birth)
  end



end
