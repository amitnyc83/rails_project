class PhysiciansController < ApplicationController


  def index
    @physicians = Physician.all
  end


  def show
    @physician = Physician.find_by(id: params[:id])
  end


  def new
    @physician = Physician.new
  end


  def create
  end


end
