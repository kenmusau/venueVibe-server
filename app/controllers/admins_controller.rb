class AdminsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    render json: Admin.all
  end

  def show
    render json: find_admin
  end

  def create
    admin = Admin.create!(admin_params)
    render json: admin, status: :created
  end

  def update
    admin = find_admin
    admin.update!(admin_params)
    render json: admin
  end

  def destroy
    admin = find_admin
    admin.destroy
    head :no_content
  end

  private

  def admin_params
    params.permit(:username, :first_name, :last_name, :email, :password, :profile_picture)
  end

  def find_admin
    Admin.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Doctor not found" }, status: :not_found
  end
end
