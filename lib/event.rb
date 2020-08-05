class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today
  end

  def date
    @date.strftime("%d/%m/%Y")
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    result = {}
    items = @food_trucks.flat_map do |food_truck|
      food_truck.inventory.keys
    end.uniq
    items.each do |item|
      total = food_trucks_that_sell(item).sum do |food_truck|
        food_truck.inventory[item]
      end
      result[item] = {quantity: total, food_trucks: food_trucks_that_sell(item)}
    end
    result
  end

  def overstocked_items
    result = []
    total_inventory.each do |item, info|
      result << item if total_inventory[item][:quantity] > 50 && total_inventory[item][:food_trucks].count > 1
    end
    result
  end

  def sorted_item_list
    sorted = @food_trucks.flat_map do |food_truck|
      food_truck.inventory.keys
    end
    sorted.flat_map do |item|
      item.name
    end.uniq.sort
  end

end
