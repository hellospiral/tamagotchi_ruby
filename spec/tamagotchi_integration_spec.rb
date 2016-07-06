require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('tamagotchi path', {:type => :feature})  do
  it('feed it') do
    visit('/')
    fill_in('name', :with => 'hi')
    click_button('Set')
    click_button('Feed')
    expect(page).to have_content(60)
  end

  it('sleep it') do
    visit('/')
    fill_in('name', :with => 'hi')
    click_button('Set')
    click_button('Sleep')
    expect(page).to have_content(60)
  end

  it('play it') do
    visit('/')
    fill_in('name', :with => 'hi')
    click_button('Set')
    click_button('Play')
    expect(page).to have_content(60)
  end

  it('kill it') do
    visit('/')
    fill_in('name', :with => 'hi')
    click_button('Set')
    sleep(6)
    click_button('Feed')
    expect(page).to have_content('DEAD')
  end

end
