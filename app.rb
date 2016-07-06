
require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('lib/**/*.rb')

get('/')  do
  erb(:index)
end

post('/tamagotchi') do
  @tamagotchi = Tamagotchi.new(params.fetch('name'))
  Tamagotchi.set_last_active()
  @name = @tamagotchi.name()
  @food = @tamagotchi.food()
  @sleep = @tamagotchi.sleep()
  @activity = @tamagotchi.activity()
  @tamagotchi.save()
  erb(:tamagotchi)
end

actions = ['food', 'sleep', 'activity']
actions.each() do |act|
  post('/' + act) do
    eval('@tamagotchi = Tamagotchi.all[0]
    @tamagotchi.time_passes(Tamagotchi.time_interval())
    Tamagotchi.set_last_active()
    if @tamagotchi.is_alive?()
      @tamagotchi.set_' + act + '_level(10)
      @name = @tamagotchi.name()
      @food = @tamagotchi.food()
      @sleep = @tamagotchi.sleep()
      @activity = @tamagotchi.activity()
      Tamagotchi.reset_all()
      @tamagotchi.save()
    else
    @name = @tamagotchi.name()
    end
    erb(:tamagotchi)')
  end
end
