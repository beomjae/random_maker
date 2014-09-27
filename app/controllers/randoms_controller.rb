class RandomsController < ApplicationController
  def index
  end

  def show
  	@project = Project.find(params[:id])
  end

  def pick
  	@project = Project.find(params[:id])

  	@result = ""
  	@project.items.each do | item |
  		ids = item.item_datas.pluck(:id)
  		random_item_data = ItemData.find(ids.sample).data
  		output_text = item.item_type.output_format.gsub("{data}",random_item_data)
  		@result = @result + output_text
  	end
  end
end
