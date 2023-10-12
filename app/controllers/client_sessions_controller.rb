class ClientSessionsController < ApplicationController
  def create
    @client = Client.find_by(username: params[:username])

    if @client&.authenticate(params[:password])
      session[:client_id] = @client.id
      puts "Session client_id: #{session[:client_id]}"
      render json: @client, status: :created
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  # client logout
  def show
    puts "Session client_id: #{session[:client_id]}"
    # puts "Session client_id Ken"
    render json: Client.find_by(id: session[:client_id])
  end

  def destroy
    session.delete :client_id
    head :no_content
  end
end
