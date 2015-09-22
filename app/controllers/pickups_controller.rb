class PickupsController < ApplicationController

  def current_pickups
    @current_pickups = Pickup.where(current_pickup: "true")
  end

end
