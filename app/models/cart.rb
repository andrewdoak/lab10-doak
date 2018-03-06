class Cart < ApplicationRecord
    
    #this will let us use object calls like: {cart.line_items.count}
    has_many :line_items, dependent: :destroy
    
end
