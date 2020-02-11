require "application_system_test_case"

class EarthquakesTest < ApplicationSystemTestCase
  setup do
    @earthquake = earthquakes(:one)
  end

  test "visiting the index" do
    visit earthquakes_url
    assert_selector "h1", text: "Earthquakes"
  end

  test "creating a Earthquake" do
    visit earthquakes_url
    click_on "New Earthquake"

    fill_in "Latitude", with: @earthquake.latitude
    fill_in "Locationsource", with: @earthquake.locationSource
    fill_in "Longitude", with: @earthquake.longitude
    fill_in "Quakeid", with: @earthquake.quakeID
    click_on "Create Earthquake"

    assert_text "Earthquake was successfully created"
    click_on "Back"
  end

  test "updating a Earthquake" do
    visit earthquakes_url
    click_on "Edit", match: :first

    fill_in "Latitude", with: @earthquake.latitude
    fill_in "Locationsource", with: @earthquake.locationSource
    fill_in "Longitude", with: @earthquake.longitude
    fill_in "Quakeid", with: @earthquake.quakeID
    click_on "Update Earthquake"

    assert_text "Earthquake was successfully updated"
    click_on "Back"
  end

  test "destroying a Earthquake" do
    visit earthquakes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Earthquake was successfully destroyed"
  end
end
