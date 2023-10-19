class BookingsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # before_action :set_booking, only: %i[ show update destroy ]

  # GET /bookings
  def index
    render json: Booking.all
  end

  # GET /bookings/1
  def show
    render json: find_booking
  end

  # POST /bookings
  def create
    booking = Booking.create!(booking_params)
    render json: booking, status: :created
  end

  # PATCH/PUT /bookings/1
  def update
    booking = find_booking
    booking.update!(booking_params)
    render json: booking
  end

  # DELETE /bookings/1
  def destroy
    booking = find_booking
    booking.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_booking
    Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:status, :check_in, :check_out, :space_id, :client_id, :amount)
  end

  def render_not_found_response
    render json: { error: "No booking not found" }, status: :not_found
  end
end
