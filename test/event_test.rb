require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'date'

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

  def test_it_can_return_total_inventory
    skip
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
    assert_equal ({item1 => {quantity: 100, food_trucks: [food_truck1, food_truck3]}, item2 => {quantity: 7, food_trucks: [food_truck1]}, item3 => {quantity: 35, food_trucks: [food_truck2, food_truck3]}, item4 => {quantity: 50, food_trucks: [food_truck2]}}), food_truck.total_inventory
  end

  def test_it_can_return_overstocked_items
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
    assert_equal [item1], event.overstocked_items
  end

  def test_it_can_return_sorted_item_list
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
    assert_equal ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"], event.sorted_item_list
  end

  def test_it_can_return_date
    stubbed = Date.parse("2020-02-24")
    Date.stubs(:today).returns(stubbed)
    event = Event.new("South Pearl Street Farmers Market")
    assert_equal "24/02/2020", event.date
  end

end

# ## Iteration 4 - Selling Items
#
# Add a method to your Event class called `sell` that takes an item and a quantity as arguments. There are two possible outcomes of the `sell` method:
#
# 1. If the Event does not have enough of the item in stock to satisfy the given quantity, this method should return `false`.
#
# 2. If the Event's has enough of the item in stock to satisfy the given quantity, this method should return `true`. Additionally, this method should reduce the stock of the FoodTrucks. It should look through the FoodTrucks in the order they were added and sell the item from the first FoodTruck with that item in stock. If that FoodTruck does not have enough stock to satisfy the given quantity, the FoodTruck's entire stock of that item will be depleted, and the remaining quantity will be sold from the next food_truck with that item in stock. It will follow this pattern until the entire quantity requested has been sold.
#
# For example, suppose food_truck1 has 35 `peach pies` and food_truck3 has 65 `peach pies`, and food_truck1 was added to the event first. If the method `sell(<ItemXXX, @name = 'Peach Pie'...>, 40)` is called, the method should return `true`, food_truck1's new stock of `peach pies` should be 0, and food_truck3's new stock of `peach pies` should be 60.
#
# Use TDD to update the `Event` class so that it responds to the following interaction pattern:
#
# ```ruby
# pry(main)> require 'date'
# #=> true
#
# pry(main)> require './lib/item'
# #=> true
#
# pry(main)> require './lib/food_truck'
# #=> true
#
# pry(main)> require './lib/event'
# #=> true
#
# #=> #<Event:0x00007fe134933e20...>
#
# pry(main)> event.date
# #=> "24/02/2020"
#
# # A event will now be created with a date - whatever date the event is created on through the use of `Date.today`. The addition of a date to the event should NOT break any previous tests.  The `date` method will return a string representation of the date - 'dd/mm/yyyy'. We want you to test this in with a date that is IN THE PAST. In order to test the date method in a way that will work today, tomorrow and on any date in the future, you will need to use a stub :)
#
# pry(main)> food_truck1 = FoodTruck.new("Rocky Mountain Pies")
# #=> #<FoodTruck:0x00007fe1348a1160...>
#
# pry(main)> food_truck1.stock(item1, 35)
#
# pry(main)> food_truck1.stock(item2, 7)
#
# pry(main)> food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
# #=> #<FoodTruck:0x00007fe1349bed40...>
#
# pry(main)> food_truck2.stock(item4, 50)
#
# pry(main)> food_truck2.stock(item3, 25)
#
# pry(main)> food_truck3 = FoodTruck.new("Palisade Peach Shack")
# #=> #<FoodTruck:0x00007fe134910650...>
#
# pry(main)> food_truck3.stock(item1, 65)
#
# pry(main)> event.add_food_truck(food_truck1)
#
# pry(main)> event.add_food_truck(food_truck2)
#
# pry(main)> event.add_food_truck(food_truck3)
#
# pry(main)> event.sell(item1, 200)
# #=> false
#
# pry(main)> event.sell(item5, 1)
# #=> false
#
# pry(main)> event.sell(item4, 5)
# #=> true
#
# pry(main)> food_truck2.check_stock(item4)
# #=> 45
#
# pry(main)> event.sell(item1, 40)
# #=> true
#
# pry(main)> food_truck1.check_stock(item1)
# #=> 0
#
# pry(main)> food_truck3.check_stock(item1)
# #=> 60
# ```
