require_relative '../test_helper'

class UserSeesGreetingOnHomepage < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_edit_a_task
    visit '/tasks'

    within(".task") do
      click_link("Edit")
    end

    fill_in 'task[title]', with: 'NEW TITLE'

    click_button 'submit'

    within('.well') do
      click_link('Back to Task Index')
    end

    within(".task") do
      assert page.has_content?("NEW TITLE")
    end

  end
end
