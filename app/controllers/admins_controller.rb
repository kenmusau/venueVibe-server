class AdminsController < ApplicationController
  def index
    render json: Admin.all
  end

  def show
    admin = find_admin
    render json: admin
  end

  def create
    admin = Admin.create(admin_params)
    render json: admin
  end

  private

  def admin_params
    params.permit(:username, :first_name, :last_name, :email, :password, :profile_picture)
  end

  def find_admin
    Admin.find(params[:id])
  end
end
