require "application_system_test_case"

class BigquakesTest < ApplicationSystemTestCase
  setup do
    @bigquake = bigquakes(:one)
  end

  test "visiting the index" do
    visit bigquakes_url
    assert_selector "h1", text: "Bigquakes"
  end

  test "creating a Bigquake" do
    visit bigquakes_url
    click_on "New Bigquake"

    fill_in "Latitude", with: @bigquake.latitude
    fill_in "Locationsource", with: @bigquake.locationSource
    fill_in "Longitude", with: @bigquake.longitude
    fill_in "Magerror", with: @bigquake.magError
    click_on "Create Bigquake"

    assert_text "Bigquake was successfully created"
    click_on "Back"
  end

  test "updating a Bigquake" do
    visit bigquakes_url
    click_on "Edit", match: :first

    fill_in "Latitude", with: @bigquake.latitude
    fill_in "Locationsource", with: @bigquake.locationSource
    fill_in "Longitude", with: @bigquake.longitude
    fill_in "Magerror", with: @bigquake.magError
    click_on "Update Bigquake"

    assert_text "Bigquake was successfully updated"
    click_on "Back"
  end

  test "destroying a Bigquake" do
    visit bigquakes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bigquake was successfully destroyed"
  end
end
