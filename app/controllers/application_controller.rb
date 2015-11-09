class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_paper_trail_whodunnit

  before_action :authenticate_user!

  def user_for_paper_trail
      current_user ? current_user.name : 'Public user'
  end


  # def info_for_paper_trail
  #   { user_id: current_user.id } if user_signed_in?
  # end




end
