class MessageController < ApplicationController
  
  def new
  	@message = Message.new  	
  end
  def create
  	@message = Message.create(params[:message])
  	redirect_to root_path
  end
end
