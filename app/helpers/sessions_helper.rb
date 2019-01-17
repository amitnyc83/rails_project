module SessionsHelper

  def login_physician(physician)
    session[:physician_id] = physician.id
  end

  def login_patient(patient)
    session[:patient_id] = patient.id
  end

  def current_physician
    @current_physician ||= Physician.find_by(id: session[:physician_id])
  end

  def current_patient
    @current_patient ||= Patient.find_by(id: session[:patient_id])
  end

  def logged_in?
    !current_physician.nil? || !current_patient.nil?
  end

  def login_required
    if !logged_in?
      redirect_to signin_path
    end
  end 


end
