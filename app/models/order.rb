class Order < ApplicationRecord
    #define the relationship from the order to the line item; 
    #including the requirement to delete all line_items when order is 'destroyed'
    has_many :line_items, dependent: :destroy
    
    enum pay_type: {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2,
    "Butter" => 3
    }
    
    #Verify that the customer enters data for all the input fields
    validates :name, :address, :email, presence: true
    validates :pay_type, inclusion: pay_types.keys

    
    #Added Lab 9. 
    #In the create action, we assumed that the order object contains the 
    #add_line_items_from_cart() method, implemented here.
    def add_line_items_from_cart(cart)
        cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
        end
    end
    
end
