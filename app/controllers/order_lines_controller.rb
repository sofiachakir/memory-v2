class OrderLinesController < ApplicationController
  def index
  	if params[:country].present? 
  		@order_lines = OrderLine.filter_by_country(params[:country])
  	else 
  		@order_lines = OrderLine.all
  	end
  end
end
