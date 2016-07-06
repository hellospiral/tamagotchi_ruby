class Tamagotchi
  define_method(:initialize) do |name|
    @name = name
    @food = 50
    @sleep = 50
    @activity = 50
  end

  define_method(:name) do
    @name
  end

  define_method(:food) do
    @food
  end

  define_method(:sleep) do
    @sleep
  end

  define_method(:activity) do
    @activity
  end

  define_method(:is_alive?) do
    if @food == 0 || @sleep == 0 || @activity == 0
      return false
    else
      return true
    end
  end

  define_method(:set_food_level) do |food|
    @food += food
  end

  define_method(:set_sleep_level) do |sleep|
    @sleep += sleep
  end

  define_method(:set_activity_level) do |activity|
    @activity += activity
  end

  define_method(:time_passes) do
    @food -= 10
    @sleep -= 5
    @activity -= 5
  end
end
