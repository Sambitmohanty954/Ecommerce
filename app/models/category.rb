class Category < ApplicationRecord
#validations

validates_presence_of :name
validates_uniqueness_of :name

#validates :name , presence: true , uniqueness: true

def formatted_name
	"#{self.id} - #{self.name}"
 	end
end
