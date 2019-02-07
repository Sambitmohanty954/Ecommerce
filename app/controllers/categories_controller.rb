class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end
	def new
		@category = Category.new
	end
	def create
			@category = Category.new(params[:category].permit(:name))
		if @category.save
			redirect_to categories_path , notice: "Sucessfully created #{@category.name}"  #"/categories"
		else
			render action: "new"
		end
	end
		def show
			@category = Category.find(params[:id])
			@products = Product.where('category_id = ?', @category.id)
		end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		previous_name = @category.name
		if @category.update_attributes(params[:category].permit(:name))
			redirect_to category_path(@category.id) , notice: "Sucessfully updated from #{previous_name} to  #{@category.name}"
		else
			render action: "edit"
		end
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path , notice: "Sucessfully destroyed #{@category.name}"
	end

end
