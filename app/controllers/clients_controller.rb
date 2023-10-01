class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    render json: Client.all
  end

  def show
    render json: find_client
  end

  def create
    client = Client.create!(client_params)
    render json: client, status: :created
  end

  def update
    client = find_client
    client.update!(client_params)
    render json: client
  end

  def destroy
    client = find_client
    client.destroy
    head :no_content
  end

  private

  def find_client
    Client.find(params[:id])
  end

  def client_params
    params.permit(:username, :first_name, :last_name, :email, :password, :profile_picture)
  end

  def render_not_found_response
    render json: { error: "Client not found" }, status: :not_found
  end
end
