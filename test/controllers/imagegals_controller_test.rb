require 'test_helper'

class ImagegalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imagegal = imagegals(:one)
  end

  test "should get index" do
    get imagegals_url
    assert_response :success
  end

  test "should get new" do
    get new_imagegal_url
    assert_response :success
  end

  test "should create imagegal" do
    assert_difference('Imagegal.count') do
      post imagegals_url, params: { imagegal: { caption: @imagegal.caption, title: @imagegal.title } }
    end

    assert_redirected_to imagegal_url(Imagegal.last)
  end

  test "should show imagegal" do
    get imagegal_url(@imagegal)
    assert_response :success
  end

  test "should get edit" do
    get edit_imagegal_url(@imagegal)
    assert_response :success
  end

  test "should update imagegal" do
    patch imagegal_url(@imagegal), params: { imagegal: { caption: @imagegal.caption, title: @imagegal.title } }
    assert_redirected_to imagegal_url(@imagegal)
  end

  test "should destroy imagegal" do
    assert_difference('Imagegal.count', -1) do
      delete imagegal_url(@imagegal)
    end

    assert_redirected_to imagegals_url
  end
end
