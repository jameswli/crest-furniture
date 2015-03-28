class AttachmentsController < ApplicationController 
before_filter :authenticate_user! 
respond_to :html 
	def create 
		@attachment = Attachment.new(attachment_params)
		@attachment.user = current_user
		if @attachment.save
			flash[:success] = "Attachment uploaded"
		else
			flash[:error] = "Could not upload attachment"
		end
		redirect_to Project.find(@attachment.project_id)
	end
	def destroy
		@attachment = Attachment.find(params[:id])
		@attachment.destroy
		flash[:success] = "Attachment deleted"
		redirect_to Project.find(@attachment.project_id)
	end

	private 
	def attachment_params  
		params.require(:attachment).permit(:name, :file_attachment, :type, :project_id)
	end
end