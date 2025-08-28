require "application_system_test_case"

class DreamsTest < ApplicationSystemTestCase
  setup do
    @dream = dreams(:first)
  end
  test "Creating a new dream" do
    visit dreams_path
    assert_selector "h1", text: "Dreams"

    click_on "New dream"
    assert_selector "h1", text: "New dream"

    fill_in "Name", with: "Capybara dream"
    click_on "Create dream"

    assert_selector "h1", text: "Dreams"
    assert_text "Capybara dream"
  end

  test "Showing a dream" do
    visit dreams_path
    click_link @dream.name

    assert_selector "h1", text: @dream.name
  end

  test "Updating a dream" do
    visit dreams_path
    assert_selector "h1", text: "Dreams"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit dream"

    fill_in "Name", with: "Updated dream"
    click_on "Update dream"

    assert_selector "h1", text: "Dreams"
    assert_text "Updated dream"
  end

  test "Destroying a dream" do
    visit dreams_path
    assert_text @dream.name

    click_on "Delete", match: :first
    assert_no_text @dream.name
  end
end

