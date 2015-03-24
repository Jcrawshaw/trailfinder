class FavoritesController < ApplicationController

  def create
    @trail = Trail.find(params[:trail_id])
    favorite = current_user.favorites.build(trail: @trail)

    authorize favorite
    if favorite.save
      flash[:notice] = "Trail added to favorites!"
     else
     flash[:notice] = "Error favoriting trail, try again."
    end
    redirect_to @trail
  end

  def destroy
    @trail = Trail.find(params[:trail_id])
    favorite = @trail.favorites.find(params[:id])

    authorize favorite
    if favorite.destroy
      flash[:notice] = "Trail removed from favorites."
    else
      flash[:notice] = "Error unfavoriting trail, try again."
    end
    redirect_to @trail
  end

end
