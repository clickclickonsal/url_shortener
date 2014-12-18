class ShrinkUrlsController < ApplicationController 

	def index
	end

	def show
		
	end

	def create
		in_url = {shrink_url: params[:shrink_url]}
		out_url = ShrinkUrl.shorten_url(in_url[:id])
		@shrink_url = ShrinkUrl.new(shrink_url_params.merge(short_url: out_url))
    respond_to do |format|
      if @shrink_url.save
        format.html {redirect_to root_path}
        format.json { render json: @shrink_url }
      else
        format.html { render :new }
        format.json { render status: 400, nothing: true }
      end
    end
	end
	
	def shrink_url_params 
		params.require(:shrink_url.permit(:original_url, :short_url))
	end
end