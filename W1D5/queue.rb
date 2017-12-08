class Queue
  def initialize(main_array=[])
    @main_array = main_array
  end

  def enqueue(el)
    @main_array.unshift(el)
  end

  def dequeue
    @main_array.pop
  end

  def show
    puts @main_array
  end
end
