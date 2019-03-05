require 'test_helper'

class UrlShortenersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get url_shorteners_index_url
    assert_response :success
  end

end
