class Map
  def initialize(main_array=[])
    @main_array = main_array
  end

  def assign(key, val)
    raise "Already has that key!" if includes_key?(key)
    @main_array.push(el)
  end

  def lookup(key)
    pair = []
    @main_array.each do |el|
      pair = el if key == el[0]
    end

    pair
  end

  def remove(key)
    @main_array.delete(lookup(key))
  end

  def show
    @main_array
  end

  def includes_key?(key)
    @main_array.each do |el|
      return true if key == el[0]
    end
  end
end
