class SecondaryController < ApplicationController
	def index

		#retrieve element id from get request
		element_id = params[:id]

		#updating click count
		@data = Content.find(element_id)
		@click_count = @data["number"]
		@click_count += 1
		@data.update(number: @click_count)

		#retrieve secondary information by identifying record id
		@sec_content = @data["sec_content"]


		#generating and rendering the json
		response.headers['Access-Control-Allow-Origin'] = '*'
		@data = {"content" => @sec_content, "id" => element_id}
		render json: @data
	end
end
