class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    admin_reports_path if resource.is_a?(Admin)
  end

  def after_sign_out_path_for(_)
    new_admin_session_path
  end


  protected

  def layout_by_resource
    return 'application' unless devise_controller?

    case resource_name
    when :admin then 'admin'
    else 'application'
    end
  end
end
