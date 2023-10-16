class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :authorize_client
  skip_before_action :authorize_client, only: [:create, :show, :update]

  def index
    render json: Client.all
  end

  def show
    # puts "Session client_id: #{session[:client_id]}"

    render json: Client.find_by(id: session[:client_id])
  end

  def create
    client = Client.create!(client_params)
    session[:client_id] = client.id
    render json: client, status: :created
  end

  def update
    client = find_client
    # client.update_attribute!(client_params)
    client.update!(client_params)
    render json: client, status: :accepted
  end

  def destroy
    client = find_client
    client.destroy
    head :no_content
  end

  private

  def find_client
    Client.find(params[:id])
    # Client.find(session[:client_id])
  end

  def client_params
    params.permit(:username, :first_name, :last_name, :email, :password, :profile_picture)
  end

  def render_not_found_response
    render json: { error: "Client not found" }, status: :not_found
  end

  def authorize_client
    render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :client_id
  end
end
