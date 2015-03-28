class Api::SessionsController < Api::BaseController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate

  def create
    @user = User.find_for_authentication(email: params[:user][:email])

    if @user && @user.valid_password?(params[:user][:password])
      @user.generate_authentication_token
 
      render :json=> {:user_email=>@user.email, :token=>@user.authentication_token}
    else
      error! :unauthenticated
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end