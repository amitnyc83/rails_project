class SessionsController < ApplicationController

  def new
   if @physician
     redirect_to physician_path(@physician)
   elsif @patient
     redirect_to patient_path(@patient)
   end
  end


  def create
    if params[:session]
      if params[:session][:email].present? && params[:session][:password].present?
        @physician = Physician.find_by(:email => params[:session][:email])
        @patient = Patient.find_by(:email => params[:session][:email])
        if @physician && @physician.authenticate(params[:session][:password ])
          login_physician(@physician)
          redirect_to physician_path(@physician)
        elsif @patient && @patient.authenticate(params[:session][:password])
          login_patient(@patient)
          redirect_to patient_path(@patient)
        else
          render :new
        end
      end
    elsif request.env['omniauth.auth'].present?
       @physician = Physician.find_or_create_by(uid: auth["uid"]) do |u|
         u.name = auth['info']['name']
         u.email = auth['info']['email']
         u.image = auth['info']['image']
       end
       session[:user_id] = @physician.id
       redirect_to physician_path(@physician)
     end
   end

  private



  def auth
    request.env['omniauth.auth']
  end
end
