class TrailsController < ApplicationController
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(params.require(:trail).permit(:title, :state, :body))
    if @trail.save
      flash[:notice] = "Trail was saved."
      redirect_to @trail
    else
      flash[:error] = "There was an error saving the trail. Please try again."
      render :new
    end
  end

  def edit
  end
end
