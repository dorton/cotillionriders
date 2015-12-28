class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def set_pickup
    @current_pickup = Pickup.find params[:id]
    @current_pickup.update :current_pickup => :true
  end


  def current_user_home
    if current_user.god_mode?
      redirect_to rails_admin_path
    elsif current_user.admin?
      redirect_to school_admin_path
    elsif current_user.gym?
      redirect_to current_pickups_path
    else
      redirect_to current_user
    end
  end


  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to current_user
    end
  end


  def show

    unless current_user.admin?
      @user = current_user
    end


  end

  def new
    @user = User.new
  end

  def edit
    unless current_user.admin?
      @user = current_user
    end
    @students = @user.students

  end


  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(:id), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: edit_user_path(:id) }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:last_name, :first_name, :admin, :email, :god_mode, :phone)
    end
end
