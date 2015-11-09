class Api::CurrentPickupController < ApplicationController

  def index
    @current_pickups = Pickup.where(current_pickup: "true").order('updated_at ASC')
  end


  def update
    @current_pickup = Pickup.find params[:id]
    @current_pickup.update :current_pickup => :false
    if @current_pickup.save
      render status: 201, json: @current_pickup
    else
      render status: 422, json: @current_pickup.errors
    end
  end

end
