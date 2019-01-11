class PhysiciansController < ApplicationController
  before_action :find_physician, only: [:show, :edit, :update]

  def index
    @physicians = Physician.all
  end


  def show
    @appointments = Appointment.where("physician_id = ?", @physician.id)
  end


  def new
    @physician = Physician.new
  end


  def create
      @physician = Physician.new(physician_params)
      if @physician.save
        flash[:notice] = "You have successfully created an account"
        redirect_to physician_path(@physician)
      else
        flash[:notice] = "There was an error creating a new Physician"
        render 'physicians/new'
      end
    end

    def edit
      if @current_physician
        unless @current_physician = @physician
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



    private

    def find_physician
      @physician = Physician.find(params[:id])
    end


    def physician_params
      params.require(:physician).permit(:name, :email, :uid, :specialty, :email, :password_digest)
    end


end
