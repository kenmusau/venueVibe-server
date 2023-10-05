class AdminsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /admins
  def index
    render json: Admin.all
  end

  # GET /admins/1
  def show
    render json: find_admin
  end

  # POST /admins
  def create
    admin = Admin.create!(admin_params)
    render json: admin, status: :created
  end

  # PATCH/PUT /admins/1
  def update
    admin = find_admin
    admin.update!(admin_params)
    render json: admin
  end

  # DELETE /admins/1
  def destroy
    admin = find_admin
    admin.destroy
    head :no_content
  end

  private

  # Only listed params allowed allowed.
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
