class MainController < ApplicationController
	def index

		#generating a list of 10 randomly generated IDs
		random_index_list = (1..20).to_a.shuffle.take(10)

		@content = {}
		@link_count = []
		@content_sorted = []
		@dependancy_reference = {"1"=>0, "2"=>0, "3"=>2, "4"=>0, "5"=>0, "6"=>0, "7"=>0, "8"=>1, "9"=>0, "10"=>0, "11"=>0, "12"=>0, "13"=>0, "14"=>0, "15"=>0, "16"=>0, "17"=>0, "18"=>0, "19"=>0, "20"=>0	}
		@dependency_map = []

		
		#accessing data corresponding to those IDs
		for index in random_index_list
			@click_count = Content.find(index)["number"]
			@content[index] = {"main_content" => Content.find(index)["main_content"], "number" => Content.find(index)["number"], "id" => Content.find(index)["id"]}
			@dependency_map.push(@dependancy_reference[index.to_s])
			print index.to_s, @dependancy_reference[index.to_s]
			@link_count.push(@click_count)
		end

		#sorting the content based onnumber of times clicked
		@link_count = @link_count.sort.reverse

		for count in @link_count
			for key in @content.keys
				if @content[key]["number"] == count
					@content_sorted.push(@content[key])
					@content.delete(key)
					break
				end
			end
		end


		#rendering the json
		response.headers['Access-Control-Allow-Origin'] = '*'
		render json: @content_sorted
	end
end
