require "test_helper"

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should have 10 clients" do
    number_of_clients = Client.count
    assert_equal 10, number_of_clients, "Expected 10 clients in the database"
  end
end
