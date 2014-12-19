class ShrinkUrlsController < ApplicationController 

	def index
		@shrink_urls = ShrinkUrl.all.reverse
	end

	def show
		@shrink_url = ShrinkUrl.find_by(short_url: params[:id]).original_url
		if @shrink_url[0..6] == "http://" || @shrink_url[0..7] == "https://"
			redirect_to "#{@shrink_url}"
		else
			redirect_to "http://#{@shrink_url}"
		end
	end

	def create
		in_url = {original_url: params[:original_url]}
		out_url = ShrinkUrl.shorten_url(in_url)
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
	
	private 

	def shrink_url_params 
		params.require(:shrink_url).permit(:original_url)
	end
end