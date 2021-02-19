require_relative './part_1_solution.rb'
require"pry"
def apply_coupons(cart, coupons)

    coupons.map do |coupon|
      cart_item = find_item_by_name_in_collection(coupon[:item], cart)
      couponed_item_in_basket = "#{coupon[:item]} W/COUPON"
      if cart_item !=nil && cart_item[:count] >= coupon[:num]
        cart << {:item => couponed_item_in_basket,
        :price => coupon[:cost] / coupon[:num],
      :clearance =>cart_item[:clearance],
    :count => coupon[:num] }
    cart_item[:count] -= coupon[:num]
      end
    end
  p cart
end
apply_coupons([
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 3},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}
],
[
  {:item => "AVOCADO", :num => 2, :cost => 5.00},
  {:item => "BEER", :num => 2, :cost => 20.00},
  {:item => "CHEESE", :num => 3, :cost => 15.00}
])

def apply_clearance(cart)
  new_cart=[]
  cart.map do |cart_item|
    new_cart_item = find_item_by_name_in_collection(cart_item[:item], new_cart)
      if new_cart_item && cart_item[:cleanrance] == true
        new_cart << {:item => new_cart_item,
        :price =>cart_item[:price]*=0.2,
        :clearance => new_cart_item[:clearance],
        :count => new_cart_item[:count]}
      #binding.pry
    end
  end
  p new_cart.uniq!
end
apply_clearance([
  {:item => "PEANUT BUTTER", :price => 3.00, :clearance => true,  :count => 2},
  {:item => "KALE", :price => 3.00, :clearance => false, :count => 3},
  {:item => "SOY MILK", :price => 4.50, :clearance => true,  :count => 1}
])

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
