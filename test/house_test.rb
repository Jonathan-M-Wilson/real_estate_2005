require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room = Room.new(:bedroom, 10, '13')
    @room2 = Room.new(:living_room, 15, '12')
    @room_3 = Room.new(:living_room, 25, '15')
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
    @house.add_room(@room1)
    @house.add_room(@room2)

    assert_equal [@room1, @room2], @house.rooms
  end

  #Iteration 3

  def test_it_is_above_market_average

    refute @house.above_market_average?
  end

end
