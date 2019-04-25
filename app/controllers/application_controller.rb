class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token,     if: -> {request.format.json?}
  before_action      :authenticate_user_from_token!, if: -> {params[:email].present?}

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, alert: exception.message }
      format.json { render json: {message: exception.message}, status: :unauthorized }
    end
  end

  def authenticate_user_from_token!
    user = User.find_by(email: params[:email])
    if Devise.secure_compare(user.try(:authentication_token), params[:token])
      sign_in user, store: false
    end
  end
end
