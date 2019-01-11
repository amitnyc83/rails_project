class SessionsController < ApplicationController

  def new
    if logged_in?
      if @current_physician
        redirect_to physician_path(@current_physician)
      elsif @current_patient
        redirect_to patient_path(@current_patient)
      end
    end
  end


  def create
    if params[:session]
      if params[:session][:name].present? && params[:session][:password].present?
        @physician = Physician.find_by(:name => params[:session][:name])
        @patient = Patient.find_by(:name => params[:session][:name])
        if @physician && @physician.authenticate(params[:session][:paswword])
          login_physician(@physician)
          redirect_to physician_path(@physician)
        elsif @patient && @patient.authenticate(params[:session][:password])
          login_patient(@patient)
          redirect_to patient_path(@patient)
        else
          render :new
        end
      end
    elsif auth.present?
          @physician = Physician.find_or_create_by(uid: auth["uid"]) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
          end
          login_physician(@physician)
          redirect_to edit_physician_path(@physician)
        end
      end


   def destroy
     reset_session
     flash[:notice] = "You have sucessfully logged out"
     redirect_to root_path
   end

  private



  def auth
    request.env['omniauth.auth']
  end
end
