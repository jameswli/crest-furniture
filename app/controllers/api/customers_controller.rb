class Api::CustomersController < Api::BaseController
    
    private

      def customer_params
        params.require(:customer).permit(:name, :organization, :email, :telephone, :cellphone, :address_line_1, :address_line_2, :city, :state, :zip_code)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:name, :organization, :email, :telephone, :cellphone, :address_line_1, :address_line_2, :city, :state, :zip_code)
      end
end
