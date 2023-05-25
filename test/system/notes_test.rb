require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    @note = notes(:first) # Reference to the first fixture quote
  end

  test "Creating a new note" do
    # When we visit the Notes#index page
    # we expect to see a title with the text "Notes"
    visit notes_path
    assert_selector "h1", text: "Notes"

    # When we click on the link with the text "New note"
    # we expect to land on a page with the title "New note"
    click_on "New note"
    assert_selector "h1", text: "New note"

    # When we fill in the name input with "Capybara note"
    # and we click on "Create Quote"
    fill_in "Name", with: "Capybara note"
    click_on "Create note"

    # We expect to be back on the page with the title "Notes"
    # and to see our "Capybara note" added to the list
    assert_selector "h1", text: "Notes"
    assert_text "Capybara note"
  end
  
  test "Showing a note" do
    visit notes_path
    click_link @note.name

    assert_selector "h1", text: @note.name
  end

  test "Updating a note" do
    visit notes_path
    assert_selector "h1", text: "Notes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit note"

    fill_in "Name", with: "Updated note"
    click_on "Update note"

    assert_selector "h1", text: "Notes"
    assert_text "Updated note"
  end

  test "Destroying a note" do
    visit notes_path
    assert_text @note.name

    click_on "Delete", match: :first
    assert_no_text @note.name
  end

end
