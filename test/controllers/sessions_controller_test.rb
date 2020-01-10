# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session' do
    get sessions_new_url
    assert_response :success
  end

  test 'should get new login' do
    get login_path
    assert_response :success
  end
end
