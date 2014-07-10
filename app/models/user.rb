class User < ActiveRecord::Base

	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates_presence_of :email, :name, :password, message: "wrong info"
	validates :name, length: {in: 4..30} 

	
	has_many :products, :through => :orders
	has_many :orders
end
