class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # rescue_from EcoficioException::SecurityTransgressionException, with: :permission_denied

  # before_action :authenticate_user!


  # def method_missing(method_name, *args)
  #   super if !method_name.to_s.match(/^require_role_(.*)$/)
  #   role_name = method_name.to_s.gsub(/^(require_role_|$)/, '')
  #   require_role(role_name)
  # end

  # private
  #   def require_role(role_name)
  #     raise EcoficioException::SecurityTransgressionException unless current_user.has_role?(role_name)
  #   end

  #   def permission_denied
  #     flash['warning'] = 'Você não tem permissão para acessar essa página. Entre em contato com o adminstrador.'
  #     redirect_to root_url
  #   end
end
