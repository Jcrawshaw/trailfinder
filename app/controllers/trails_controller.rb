class TrailsController < ApplicationController
  def index
    @trails = Trail.all
    @hash = Gmaps4rails.build_markers(@trails) do |trail, marker|
      marker.lat trail.latitude
      marker.lng trail.longitude
      marker.title trail.title
    end
  end

  def show
    @trail = Trail.find(params[:id])
    @posts = @trail.posts
    @hash = Gmaps4rails.build_markers(@trail) do |trail, marker|
      marker.lat trail.latitude
      marker.lng trail.longitude
      marker.title trail.title
    end
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(params.require(:trail).permit(:title, :state, :address, :latitude, :longitude, :body, :images))
    if @trail.save
      flash[:notice] = "Trail was saved."
      redirect_to @trail
    else
      flash[:error] = "There was an error saving the trail. Please try again."
      render :new
    end
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    @trail = Trail.find(params[:id])
    if @trail.update_attributes(params.require(:trail).permit(:title, :state, :address, :latitude, :longitude, :body, :images))
      flash[:notice] = "Trail was updated."
      redirect_to @trail
    else
      flash[:error] = "There was an error updating the trail. Please try again."
      render :edit
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    if @trail.destroy
      flash[:notice] = "Trail was deleted successfully."
      redirect_to trails_path
    else
      flash[:error] ="There was an error deleting the trail."
      render :show
    end
  end

end
