require 'test_helper'

class CodesControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get codes_index_url
    assert_response :success
  end

end
