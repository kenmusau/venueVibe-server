class ClientSessionsController < ApplicationController
  def create
    client = Client.find_by(username: params[:username])

    if client&.authenticate(params[:password])
      log_in(client)
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
end

# {
#   "username": "client1",
#   "password": "password"
# }
