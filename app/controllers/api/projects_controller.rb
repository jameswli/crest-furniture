class Api::ProjectsController < Api::BaseController

    private

      def project_params
        params.require(:project).permit(:name, :type, :stage, :customer_id, :sale_delivery, :rental_delivery, :rental_pickup)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:name, :type, :stage, :customer_id, :sale_delivery, :rental_delivery, :rental_pickup)
      end

end