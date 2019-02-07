class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :name
    	t.text :description
    	t.float :price
    	t.integer :category_id
    	t.integer :stock
    	t.boolean :cod_eligibility , default: true
    	#arguements for method we use colon before,options for the method we use colon after
    	t.string :image_url

      t.timestamps
    end
  end
end
