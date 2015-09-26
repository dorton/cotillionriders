class PickupsController < ApplicationController

  def current_pickups
    if current_user.admin?
      @current_pickups = Pickup.where(current_pickup: "true")
    else
      redirect_to current_user
    end

  end

end
