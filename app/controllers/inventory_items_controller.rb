class InventoryItemsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  def index
    @items = InventoryItem.all
  end

  def new
    @item = InventoryItem.new;
  end

  def create
     @item = InventoryItem.new(item_params)
     @style = InventoryStyle.find(@item.inventory_style_id);
 
    if @item.save
        flash[:success] = "Item added"
        redirect_to @style
      else
        render 'new'
    end
  end

  def edit
    @item = InventoryItem.find(params[:id])
    @style = InventoryStyle.find(@item.inventory_style_id);
  end

  def update
    @item = InventoryItem.find(params[:id])
    @style = InventoryStyle.find(@item.inventory_style_id)
    if @item.update(item_params)
      redirect_to :back
    else
      flash.now[:error] = "Please fix the errors."
      render 'edit'
    end
  end

  def show
    @items = InventoryItem.all
    @newItem = InventoryItem.new;
    @item = InventoryItem.find(params[:id])
  end

  def destroy
    @item = InventoryItem.find(params[:id])
    @item.destroy
    flash[:success] = "Item deleted"
    redirect_to inventory_items_path
  end

  # def check
  #   start_date end_date
  #   @result = InventoryItem.
  # end 

  private

  def item_params
      params.require(:inventory_item).permit(:serial_number, :status, :condition, :inventory_style_id, :project_id)
  end   

end
