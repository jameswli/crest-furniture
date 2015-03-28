class Api::UsersController < Api::BaseController

    private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
      end

      def query_params
        params.permit(:name, :email, :password, :password_confirmation, :role)
      end

end
