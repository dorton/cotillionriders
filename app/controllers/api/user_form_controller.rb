class Api::UserFormController < ApplicationController
  def parents
    if current_user.admin?
      @users = User.all
      @students = Student.all
    else
      redirect_to root_path
    end
  end

  def parent
    @user = current_user
  end

  def update
    @user = User.find params[:id]
  end

  def students
    @students = Student.all
  end

end
