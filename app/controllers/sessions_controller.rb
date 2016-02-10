class SessionsController < ApplicationController

  def new
    @person = Person.new
  end

  def create
    if current_person && current_person.authenticate(params[:password])
      session[:person_id] = current_person.id
      redirect_to root_path, notice: "You are now signed in"
    else
      render :new
    end
  end

  def destroy
    session[:person_id] = nil
    redirect_to root_path, notice: "You are now signed out"
  end


  private

  def current_person
    @current_person ||= Person.find_by_email(params[:email])
  end

end
