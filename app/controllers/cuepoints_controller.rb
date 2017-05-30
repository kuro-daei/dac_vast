class CuepointsController < ApplicationController

  before_action :set_cuepoint, only: [:edit, :update, :destroy]

  def index
    @cuepoints = Cuepoint.all
  end

  def new
    @cuepoint = Cuepoint.new
  end

  def create
    @cuepoint = Cuepoint.new(cuepoint_params)
    if @cuepoint.save
      redirect_to cuepoints_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @cuepoint.update(cuepoint_params)
      redirect_to cuepoints_path
    else
      render 'edit'
    end
  end

  def destroy
    @cuepoint.destroy
    redirect_to cuepoints_path
  end

  private

    def cuepoint_params
      params[:cuepoint].permit(:name)
    end

    def set_cuepoint
      @cuepoint = Cuepoint.find(params[:id])
    end
end
