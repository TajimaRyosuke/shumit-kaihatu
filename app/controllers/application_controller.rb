class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # deviseのログイン後遷移先指定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_posts_path
    when User
      posts_path
    end
  end

  protected

  # userのログイン時にnameの登録をする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
