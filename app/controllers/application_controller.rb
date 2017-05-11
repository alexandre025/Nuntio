class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_team

  def current_team
    @current_team ||= Team.current
  end

  private

  def require_team_tenancy
    redirect_to root_path if Apartment::Tenant.current == 'public'
  end
end
