require "application_system_test_case"

class ImagegalsTest < ApplicationSystemTestCase
  setup do
    @imagegal = imagegals(:one)
  end

  test "visiting the index" do
    visit imagegals_url
    assert_selector "h1", text: "Imagegals"
  end

  test "creating a Imagegal" do
    visit imagegals_url
    click_on "New Imagegal"

    fill_in "Caption", with: @imagegal.caption
    fill_in "Title", with: @imagegal.title
    click_on "Create Imagegal"

    assert_text "Imagegal was successfully created"
    click_on "Back"
  end

  test "updating a Imagegal" do
    visit imagegals_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @imagegal.caption
    fill_in "Title", with: @imagegal.title
    click_on "Update Imagegal"

    assert_text "Imagegal was successfully updated"
    click_on "Back"
  end

  test "destroying a Imagegal" do
    visit imagegals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Imagegal was successfully destroyed"
  end
end
