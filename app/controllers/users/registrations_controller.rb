class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
    #@user.terms = params[:terms] == '1' ? true : false
  end

  def create
    @user = User.new(user_params)
    @user.terms = user_params[:terms] == '1' ? true : false

    if @user.save
      sign_in(@user)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :terms)
    end

end
