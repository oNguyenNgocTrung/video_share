# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    if User.find_by(email: sign_in_params[:email])
      self.resource = warden.authenticate!(auth_options)
      set_flash_message! :notice, :signed_in
    else
      self.resource = resource_class.new sign_in_params
      resource.save!
      set_flash_message! :notice, :signed_up
    end
    sign_in(resource_name, resource)
    respond_with resource, location: after_sign_in_path_for(resource)
  rescue => e
    flash[:alert] = e.message
    redirect_to root_path
  end
end
