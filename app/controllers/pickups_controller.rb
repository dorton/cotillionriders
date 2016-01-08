class PickupsController < ApplicationController

  def current_pickups
    if current_user.gym?
      @current_pickups = Pickup.where(current_pickup: "true")
  elsif current_user.admin?
      @current_pickups = Pickup.where(current_pickup: "true")
  else
      redirect_to current_user
    end

    if current_user.gym?
      render :layout => 'gym'
    end


  end

end
