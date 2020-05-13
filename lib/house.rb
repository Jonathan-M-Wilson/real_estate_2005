class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    false unless @price.delete("$").to_i > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all { |room| room.category == category}
  end

#unfinished getting 1915
  def area
    house_area = 0

    @rooms.each do |room|
      house_area += room.area
    end
    return house_area
  end

#unfinished
  def details
    house_details = {
      "price" => @price,
      "address" => @address
    }
  end
end
