class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def log_in(client)
    session[:client_id] = client.id
  end

  def current_client
    Client.find_by(id: session[:client_id])
  end

  def logged_in?
    !!current_client
  end

  private

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
