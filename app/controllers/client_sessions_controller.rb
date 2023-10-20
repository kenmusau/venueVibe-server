class ClientSessionsController < ApplicationController
  before_action :authorize_client
  skip_before_action :authorize_client, only: [:create, :show, :auto_login, :destroy]

  def create
    client = Client.find_by(username: params[:username])

    if client&.authenticate(params[:password])
      # log_in(client)
      session[:client_id] = client.id
      puts "Session client_id login: #{session[:client_id]}"
      render json: client, status: :created
    else
      render json: { error: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  def show
    puts "Session client_id me: #{session[:client_id]}"
    render json: Client.find_by(id: session[:client_id])
  end

  def auto_login
    if logged_in?
      client = current_client
      puts "Session client_id me: #{session[:client_id]}"
      render json: client
    else
      render json: { error: "not logged in" }
    end
  end

  # client logout
  def destroy
    session.delete :client_id
    head :no_content
  end

  private

  def authorize_client
    render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :client_id
  end
end

# {
#   "username": "client1",
#   "password": "password"
# }
