class Tamagotchi
  @@all_tamagotchi = []
  @@last_active = nil
  define_method(:initialize) do |name|
    @name = name
    @food = 50
    @sleep = 50
    @activity = 50
  end

  define_singleton_method(:all) do
    @@all_tamagotchi
  end

  define_method(:save) do
    @@all_tamagotchi.unshift(self)
  end

  define_singleton_method(:reset_all) do
    @@all_tamagotchi = []
  end

  define_singleton_method(:set_last_active) do
    @@last_active = Time.now.to_i
  end

  define_singleton_method(:time_interval) do
    now = Time.now.to_i
    (now - @@last_active) / 1
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
    if @food <= 0 || @sleep <= 0 || @activity <= 0
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

  define_method(:time_passes) do |interval|
    @food -= (10 * interval)
    @sleep -= (5 * interval)
    @activity -= (5 * interval)
  end
end
