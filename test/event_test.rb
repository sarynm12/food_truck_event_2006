require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/food_truck'
require './lib/event'

class EventTest < Minitest::Test

  def test_it_exists
    event = Event.new("South Pearl Street Farmers Market")
    assert_instance_of Event, event
  end

  def test_it_has_attributes
    event = Event.new("South Pearl Street Farmers Market")
    assert_equal "South Pearl Street Farmers Market", event.name
  end

  def test_it_starts_with_no_food_trucks
    event = Event.new("South Pearl Street Farmers Market")
    assert_equal [], event.food_trucks
  end

  def test_it_can_add_food_trucks
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    assert_equal [food_truck1, food_truck2, food_truck3], event.food_trucks
  end

  def test_it_can_return_food_truck_names
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    assert_equal ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"], event.food_truck_names
  end

  def test_it_can_return_food_trucks_that_sell_an_item
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    assert_equal [food_truck1, food_truck3], event.food_trucks_that_sell(item1)
    assert_equal [food_truck2], event.food_trucks_that_sell(item4)
  end

  def test_it_can_calculate_potential_revenue
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    assert_equal 148.75, food_truck1.potential_revenue
    assert_equal 345.00, food_truck2.potential_revenue
    assert_equal 243.75, food_truck3.potential_revenue
  end

end



# ## Iteration 2 - Event and FoodTrucks
#
# A FoodTruck will be able to calculate their `potential_revenue` - the sum of all their items' price * quantity.
#
# A Event is responsible for keeping track of FoodTrucks. It should have a method called `food_truck_names` that returns an array of all the FoodTruck's names.
#
# Additionally, the Event should have a method called `food_trucks_that_sell` that takes an argument of an item represented as a String. It will return a list of FoodTrucks that have that item in stock.
#
# Use TDD to create a `Event` class that responds to the following interaction pattern:
#
# ```ruby
# pry(main)> require './lib/item'
# #=> true
#
# pry(main)> require './lib/food_truck'
# #=> true
#
# pry(main)> require './lib/event'
# #=> true

# pry(main)> event.food_trucks_that_sell(item1)
# #=> [#<FoodTruck:0x00007fe1348a1160...>, #<FoodTruck:0x00007fe134910650...>]
#
# pry(main)> event.food_trucks_that_sell(item4)
# #=> [#<FoodTruck:0x00007fe1349bed40...>]
#
# pry(main)> food_truck1.potential_revenue
# #=> 148.75
#
# pry(main)> food_truck2.potential_revenue
# #=> 345.00
#
# pry(main)> food_truck3.potential_revenue
# #=> 243.75
# ```
