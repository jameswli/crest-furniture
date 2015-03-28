class ProjectItemsController < ApplicationController
  before_filter :authenticate_user!

  def create
	project_item = ProjectItem.new(project_item_params)
	if params[:project_item][:inventory_style_id]
		project_item.inventory_style = InventoryStyle.find(params[:project_item][:inventory_style_id])
	end

	if project_item.save
	  flash[:success] = "Item added"
	else
	  flash[:error] = "Could not add item"
	end

	redirect_to :back
  end

  def destroy
	project_item = ProjectItem.find(params[:id])

	if project_item.destroy
	  flash[:success] = "Item removed"
	else
	  flash[:error] = "Could not remove item"
	end

	redirect_to :back
  end

  def remove_style
  	p = Project.find(params[:project_id])
  	p_items = p.project_items.joins(inventory_item: :inventory_style).where(inventory_items: {inventory_style_id: params[:inventory_style_id]})

  	if p_items.map { |i| i.destroy }
  		flash[:success] = "Style removed"
  	else
  		flash[:error] = "Could not remove style"
  	end

  	redirect_to :back
  end

  private

  def project_item_params
      params.require(:project_item).permit(:project_id, :inventory_item_id)
  end 

end
