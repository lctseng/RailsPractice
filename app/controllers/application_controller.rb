class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters , :if => :devise_controller?
  before_filter :set_locale

  def set_locale
     if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
        session[:locale] = params[:locale]
     end

     I18n.locale = session[:locale] || I18n.default_locale
  end

  def login_required
      if current_user.blank?
         respond_to do |format|
            format.html {
               authenticate_user!
            }
            format.js{
               render :partial => "common/no_logined"
            }
            format.all{
               head(:unauthorized)
            }
         end
      end
  end

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:name , :email , :password , :password_confirmation)
     end
  end

end
