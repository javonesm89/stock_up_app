class Order < ActiveRecord::Base
    belongs_to :stock
    belongs_to :investor
end