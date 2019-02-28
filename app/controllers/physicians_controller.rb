class PhysiciansController < ApplicationController
  before_action :login_required, except: [:new, :show, :index, :create]
  before_action :find_physician, only: [:show, :edit, :update]

  def index
    @physicians = Physician.all
    respond_to do |f|
      f.html {render :index}
      f.json {render :@physicians}
    end
  end


  def show
    if @current_physician == @physician
      @appointments = Appointment.upcoming.where("physician_id = ?", @current_physician.id)
      respond_to do |format|
        format.html {render :show}
        format.json {render json: @current_physician}
      end
    else
      @appointments = nil
    end
  end



    def new
      if @current_physician
        flash[:notice] = "You are already a member of AppointmentMD"
        redirect_to physician_path(@current_physician)
       elsif @current_patient
        flash[:notice] = "You cannot create a Physician account"
        redirect_to patient_path(@current_patient)
      end
      @physician = Physician.new
    end


    def create
      @physician = Physician.new(physician_params)
      if @current_physician
        flash[:notice] = "You already have an account"
        redirect_to physician_path(@current_physician)
      elsif @current_patient
        flash[:notice] = "You can't create a Physician account"
        redirect_to patient_path(patient)
      end
      if @physician.save
        login_physician(@physician)
        flash[:notice] = "You have successfully created an account."
        redirect_to physician_path(@physician)
      else
        flash[:notice] =" There  was an error creating a new Physician"
        render 'physicians/new'
      end
    end



    def edit
      if @current_physician
        unless @current_physician == @physician
          redirect_to physician_path(@current_physician)
        end
      elsif @current_patient
        redirect_to patient_path(@current_patient)
      else
        redirect_to root_path
      end
    end


    def update
      if @current_physician
        if @current_physician == @physician
          if @physician.update(physician_params)
            flash[:notice] = "Your info was successfully updated"
            redirect_to physician_path(@physician)
          else
            flash[:notice] = "Error updating Info! Plz make sure all fileds are filled out."
            render 'physicians/new'
          end
        else
          flash[:notice] = "You cannot edit another Physician's Info"
        end
      else
        flash[:notice] = "You have to be a Physician to edit a Physician's Info "
      end
    end

    def surgeons
      @physicians = Physician.type_of_Specialty
      render 'physicians/index'
    end



    private


    def physician_params
      params.require(:physician).permit(:name, :email, :uid, :specialty, :email, :password)
    end

    def find_physician
       @physician = Physician.find(params[:id])
    end


  end
