require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                        email: "asjdh@ajshd",
                                        password: "foo",
                                        password_confirmation: "bar"} }
    end
    assert_template 'users/new'
  end
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { name: "example user",
                                        email: "user@example.com",
                                        password: "123456",
                                        password_confirmation: "123456"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
