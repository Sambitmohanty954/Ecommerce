class Product < ApplicationRecord

	#inbuilt validations
	validates_presence_of :name,:price,:category_id
	validates_numericality_of :price, :stock, greater_than: 1
	validates_numericality_of :stock , greater_than_or_equal_to: 0
	#validates_numericality_of :category_id , greater_than: 0
	validates_length_of :description, minimum: 10 #maximum: 100
	validate :check_for_cod_based_on_price #invoke custom validations

	validate :check_category_for_cod

	#custom_validations
	def check_for_cod_based_on_price 
		if !self.price.nil?
			if self.price > 12000 && self.cod_eligibility
				self.errors.add(:cod_eligibility, "Cod is not Available for this product")
			end
		end
	end
	def check_category_for_cod
		if !self.catgeory_id.nil?
			if(self.category_id == 1  || self.catgeory_id == 2 )&&self.cod_eligibility
				self.errors.add(:cod_eligibility, "not Available for this catgeory")
			end
		end
	end

end
