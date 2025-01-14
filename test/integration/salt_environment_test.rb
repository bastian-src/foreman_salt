require 'test_plugin_helper'
require 'integration_test_helper'

module ForemanSalt
  class SaltEnvironmentTest < IntegrationTestWithJavascript
    test 'index page' do
      FactoryBot.create_list :salt_environment, 5
      assert_index_page(salt_environments_path, 'Salt Environment', 'New Salt Environment')
    end

    test 'create new page' do
      assert_new_button(salt_environments_path, 'New Salt Environment', new_salt_environment_path)
      fill_in 'foreman_salt_salt_environment_name', with: 'common'
      assert_submit_button(salt_environments_path)
      assert page.has_link? 'common'
    end

    test 'edit page' do
      salt_environment = FactoryBot.create :salt_environment
      visit salt_environments_path
      click_link salt_environment.name
      fill_in 'foreman_salt_salt_environment_name', with: 'some_other_name'
      assert_submit_button(salt_environments_path)
      assert page.has_link? 'some_other_name'
    end
  end
end
