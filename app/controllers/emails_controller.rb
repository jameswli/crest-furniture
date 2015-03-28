class EmailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @email = Email.new
  	@email.subject = params['subject']
  	@email.body = params['stripped-text']
  	@email.from_address = params['sender']
  	@email.to_address = params['recipient']
    #parse the recipient to get either  a project ID or  a customer ID 
  	@email.timestamp = params['timestamp']
  	if @email.save
  		flash[:success] = "Email Created"
  	else
  		flash[:failure] = "Email not made correctly"
  	end
  end

  def destroy
  	@email = Email.find(params[:id])
  	@email.destroy
  end

  private
  def email_params
  	params.require(:email).permit(:project_id, :customer_id, :from_address, :to_address, :subject, :body, :timestamp)
  end

end

 