class DisplayController < ApplicationController
	def index
		#generating a list of 10 randomly generated IDs
		random_index_list = (1..20).to_a.shuffle.take(10)

		@content = {}
		@link_count = []
		@content_sorted = []
		
		#accessing data corresponding to those IDs
		for index in random_index_list
			@click_count = Content.find(index)["number"]
			@content[index] = {"main_content" => Content.find(index)["main_content"], "number" => Content.find(index)["number"], "id" => Content.find(index)["id"]}
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

		@content = @content_sorted
		
	end
end
