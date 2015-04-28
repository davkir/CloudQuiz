class RegistrationsController < Devise::RegistrationsController

  def after_inactive_sign_up_path_for(resource)
    '/registrationcomplete'
  end
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :score
      devise_parameter_sanitizer.for(:sign_up) << :level
    end

  
end