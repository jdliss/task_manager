require_relative '../test_helper'

class UserSeesGreetingOnHomepage < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_a_task
    visit '/'
    click_link("New Task")

    fill_in 'task[title]', with: 'happy puppies'
    fill_in 'task[image]', with: "https://s-media-cache-ak0.pinimg.com/736x/88/a2/75/88a2752c3738039aa8e9c067c7ddc3f7.jpg"
    fill_in 'task[description]', with: 'just loooooooooooooooook at him'
    click_button 'submit'

    within('.container') do
      assert page.has_content?("happy puppies")
    end
  end
end
