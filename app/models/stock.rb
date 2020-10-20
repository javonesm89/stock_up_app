class Stock < ActiveRecord::Base
    has_many :orders
    has_many :investors, through: :orders
end