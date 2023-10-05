class PaymentsController < ApplicationController
  # before_action :set_payment, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /payments
  def index
    render json: Payment.all
  end

  # GET /payments/1
  def show
    render json: find_payment
  end

  # POST /payments
  def create
    payment = Payment.create!(payment_params)
    render json: @payment, status: :created
  end

  # PATCH/PUT /payments/1
  def update
    payment = find_payment
    payment.update!(payment_params)
    render json: @payment
  end

  # DELETE /payments/1
  def destroy
    payment = find_payment
    payment.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_payment
    Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:amount, :booking_id, :payment_date, :status)
  end

  def render_not_found_response
    render json: { error: "Payment not found" }, status: :not_found
  end
end
