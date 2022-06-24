class ApplicationController < ActionController::Base

  private

  def authenticate_admin_customer
    unless customer_signed_in? || admin_signed_in?
      redirect_to new_customer_session_path, alert: "ログインまたは会員登録してください。"
    end
  end
end
