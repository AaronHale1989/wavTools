require 'test_helper'

class EventControllerTest < ActionDispatch::IntegrationTest
  test "should get stripe_callback" do
    get event_stripe_callback_url
    assert_response :success
  end

  test "should get payment_profile" do
    get event_payment_profile_url
    assert_response :success
  end

end
