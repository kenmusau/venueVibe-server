class ClientsController < ApplicationController
  def index
    render json: Client.all
  end
end
