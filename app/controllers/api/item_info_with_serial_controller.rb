class Api::ItemInfoWithSerialController < Api::BaseController

  def create
    @item = InventoryItem.find_by_serial_number(params[:serial_number])

    if @item
      render :json=> {:serial_number=>@item.serial_number, :item_style=>@item.inventory_style, :projects=>@item.projects}
     else
      error! :unauthenticated
    end
  end

  # def update
  #   @item = InventoryItem.find_by_serial_number(params[:serial_number])
  #   @item.update(items_params)
  #   render :json=> {:status=>@item.status}
  # end
 
  private
 
  def items_params
    params.require(:inventory_item).permit(:serial_number)
  end
end