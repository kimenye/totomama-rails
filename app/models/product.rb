class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description, :name, :price, :rating, :category_id

  attr_accessible :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end