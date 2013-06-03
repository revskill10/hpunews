
require 'my_handler'


class HomeController < ApplicationController
  before_filter :init_client
  include MyHandler
  def search
  	  	# Make an object to represent the XML-RPC server.
  	page = params[:page]
  	per = params[:page_limit]
  	type = params[:type] || ""
	param = params[:term] || ""
	render json: {:users => [] } if  param.empty?

	# Call the remote server and get our result
	if type.empty?
		result = MyHandler.getmasinhvien("*#{param}*", page.to_i, per.to_i) 
		res = JSON.parse(result)
		render json: {:users => res["results"], :total => res["total"] }
	else
		result = MyHandler.getinfo(type, "*#{param}*", page.to_i, per.to_i)
		r = JSON.parse(result)
		res = r["results"].map { |r| {:name => r["ten_khoa_hoc"]} }		
		render json: {type.to_sym => res, :total => r["total"]}
	end

	
  end
  def index
		
  end
  def create

  end
  private
  def init_client
	
	@message = Message.new	
  end
end
