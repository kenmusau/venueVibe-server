class SpacesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    render json: Space.all
  end

  def show
    space = find_space
    render json: space
  end

  def create
    space = Space.create!(space_params)
    render json: space, status: :created
  end

  def update
    space = find_space
    space.update!(space_params)
    render json: space
  end

  def destroy
    space = find_space
    space.destroy
    head :no_content
  end

  private

  def find_space
    Space.find(params[:id])
  end

  def space_params
    params.permit(:name, :location, :price, :status, :image, :description, :contact, :admin_id, :client_id)
  end

  def render_not_found_response
    render json: { error: "Space not found" }, status: :not_found
  end
end
