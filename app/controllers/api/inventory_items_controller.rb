class Api::InventoryItemsController < Api::BaseController

    private

      def inventory_item_params
        params.require(:inventory_item).permit(:serial_number, :status, :condition, :inventory_style_id)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:serial_number, :status, :condition, :inventory_style_id)
      end

end
