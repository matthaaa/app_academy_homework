class Stack
  def initialize(main_array=[])
    @main_array = main_array
  end

  def add(el)
    @main_array.push(el)
  end

  def remove
    @main_array.pop
  end

  def show
    @main_array
  end
end
