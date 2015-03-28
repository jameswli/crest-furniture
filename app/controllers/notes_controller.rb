class NotesController < ApplicationController
  before_filter :authenticate_user! 
  respond_to :html

  def create
  	@note = Note.new(note_params)
    @note.user = current_user
    @note.note_type = "note"

  	if @note.save
  		flash[:success] = "New Note Created"
      if @note.customer_id
        redirect_to Customer.find(@note.customer_id)
      else
        redirect_to Project.find(@note.project_id)
      end
  	else
  		flash[:error] = "Please fix the errors"
  	end
  end

  def update
    @note = Note.find(params[:id])

    if current_user.id = @note.user_id
      if @note.update(note_params)
        flash[:success] = "Note Updated"
        redirect_to :back
      else
        flash[:error] = "Could not update note"
      end
    else
      flash[:error] = "You cannot edit this note"
    end
  end

  def destroy
    @note = Note.find(params[:id])
    
    if current_user.id = @note.user_id
      if @note.destroy
        flash[:success] = "Note Deleted"
        redirect_to :back
      else
        flash[:error] = "Could not delete note"
      end
    else
      flash[:error] = "You cannot delete this note"
    end
  end 

  private

  def note_params 
  	params.require(:note).permit(:body, :project_id, :customer_id, :user_id)
  end

end
