require "test_helper"

class UserTest < ActiveSupport::TestCase
   test "can create user" do
     user = User.new
     assert user.invalid?
   end
end
