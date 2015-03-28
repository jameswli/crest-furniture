class InventoryStylesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  def index
  	@styles = InventoryStyle.all
  end

  def new
  	@style = InventoryStyle.new
  end
  
  def create
    @style = InventoryStyle.new(style_params)
    if @style.save
        flash[:success] = "Style created"
        redirect_to @style
      else
        render 'new'
    end
  end

  def show
    @style = InventoryStyle.find(params[:id])
    @item = InventoryItem.new(:inventory_style_id => @style.id)
  end

  def edit
    @style = InventoryStyle.find(params[:id])
  end

  def update
    @style = InventoryStyle.find(params[:id])
    if @style.update(style_params)
      redirect_to @style
    else
      flash.now[:error] = "Please fix the errors."
      render 'edit'
    end
  end

  def destroy
    @style = InventoryStyle.find(params[:id])
    @style.destroy
    flash[:success] = "Style deleted"
    redirect_to inventory_styles_path
  end

  private

  def style_params
  		params.require(:inventory_style).permit(:name, :manufacturer, :model_number, :color, :picture)
  end		

end
