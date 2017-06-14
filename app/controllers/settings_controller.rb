class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def update_user_infos
    if current_user.update(user_infos_params)
      flash[:infos_notice] = 'Mise à jour effectuée avec succès'
    else
      flash[:infos_notice] = nil
    end
    render :index
  end

  def update_user_password
    if current_user.update(user_password_params)
      flash[:password_notice] = 'Mise à jour effectuée avec succès'
    else
      flash[:password_notice] = nil
    end
    render :index
  end

  private
    def user_infos_params
      params.require(:user).permit(:firstname, :lastname, :email)
    end
    def user_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
