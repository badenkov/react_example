class Web::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_gon_variables

  private

  def set_gon_variables
    gon.faye_url = configus.faye_url
  end
end
