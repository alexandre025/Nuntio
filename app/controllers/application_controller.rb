class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout Proc.new { |controller| controller.request.xhr? ? '/layouts/modal' : '/layouts/application' }

  before_action :set_raven_context

  def after_sign_in_path_for(resource_or_scope)
   towers_path
  end

  private

    def set_raven_context
      Raven.user_context(id: current_user.id, email: current_user.email) if user_signed_in?
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end
end
