class AdminSessionsController < ApplicationController
  def create
    admin = Admin.find_by(username: params[:username])

    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      render json: admin, status: :created
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  #  Logout admin
  def destroy
    session.delete :admin_id
    head :no_content
  end
end
