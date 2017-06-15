class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def general
    flash[:password_notice] = nil
    if current_user.update(user_params)
      flash[:infos_notice] = 'Mise à jour effectuée avec succès'
    else
      flash[:infos_notice] = nil
    end
    render :index
  end

  def general_update
    flash[:password_notice] = nil
    if current_user.update(user_params)
      flash[:infos_notice] = 'Mise à jour effectuée avec succès'
    else
      flash[:infos_notice] = nil
    end
    render :index
  end

  def password_update
    flash[:infos_notice] = nil
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      flash[:password_notice] = 'Mise à jour effectuée avec succès'
    else
      flash[:password_notice] = nil
    end
    render :index
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end
