require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/food_truck'

class FoodTruckTest < Minitest::Test

  def test_it_exists
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_instance_of FoodTruck, food_truck
  end

  def test_it_has_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_equal "Rocky Mountain Pies", food_truck.name
  end

  def test_it_starts_with_no_inventory
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    assert_equal ({}), food_truck.inventory
  end

end



# #=> #<FoodTruck:0x00007f85683152f0...>
#
# pry(main)> food_truck.name
# #=> "Rocky Mountain Pies"
#
# pry(main)> food_truck.inventory
# #=> {}
#
# pry(main)> food_truck.check_stock(item1)
# #=> 0
#
# pry(main)> food_truck.stock(item1, 30)
#
# pry(main)> food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
#
# pry(main)> food_truck.check_stock(item1)
# #=> 30
#
# pry(main)> food_truck.stock(item1, 25)
#
# pry(main)> food_truck.check_stock(item1)
# #=> 55
#
# pry(main)> food_truck.stock(item2, 12)
#
# pry(main)> food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
# ```
