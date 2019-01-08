class PhysiciansController < ApplicationController
  before_action :find_physician, [:index, :new, :create]

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
        render 'physician/new'
      end
    end

    def edit
    end


    def update
      if @physician.update(physician_params)
        redirect_to physician_path(@physician)
      else
        flash[:notice] = "Error updating Info! Plz make sure all fileds are filled out."
        render 'physician/new'
      end
    end



    private

    def find_physician
      @physician = Physician.find_by(params[:id])
    end


    def physician_params
      params.require(:physician).permit(:name, :specialty, :email, :password)
    end


end
