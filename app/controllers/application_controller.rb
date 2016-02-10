class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_person
  def current_person
    @current_person ||= Person.find(session[:person_id]) if session[:person_id]
  end

  helper_method :person_signed_in?
  def person_signed_in?
    if current_person
      true
    else
      false
    end
  end

  def authenticate_person!
    redirect_to sign_in_path unless person_signed_in?
  end
end
