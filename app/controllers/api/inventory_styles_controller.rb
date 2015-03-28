class Api::InventoryStylesController < Api::BaseController

    private

      def inventory_style_params
        params.require(:inventory_style).permit(:name, :manufacturer, :model_number, :color)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:name, :manufacturer, :model_number, :color)
      end

end