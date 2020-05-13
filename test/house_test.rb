require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:living_room, 15, '12')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists

    assert_instance_of House, @house
  end

  def test_it_has_a_price

    assert_equal "$400000", @house.price
  end

  def test_it_has_an_address

    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_rooms

    assert_equal [], @house.rooms
  end

  def test_house_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end

  #Iteration 3

  def test_it_is_above_market_average

    refute @house.above_market_average?
  end

  def test_it_seperates_rooms_by_category_bedroom
    @house.add_room(@room_1)

    assert_equal [@room_1],@house.rooms_from_category(:bedroom)
  end

  def  test_it_seperates_rooms_by_category_living_room
    @house.add_room(@room_2)
    @house.add_room(@room_3)

    assert_equal [@room_2, @room_3], @house.rooms_from_category(:living_room)
  end

  def test_it_seperates_rooms_by_category_basement
    @house.add_room(@room_4)

    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_it_can_find_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_it_has_details

  assert_equal {"price" => 400000, "address" => "123 sugar lane"}, @house.details
end
