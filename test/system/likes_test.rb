require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  setup do
    @like = likes(:one)
  end

  test "visiting the index" do
    visit likes_url
    assert_selector "h1", text: "likes"
  end

  test "creating a like" do
    visit likes_url
    click_on "New like"

    click_on "Create like"

    assert_text "like was successfully created"
    click_on "Back"
  end

  test "updating a like" do
    visit likes_url
    click_on "Edit", match: :first

    click_on "Update like"

    assert_text "like was successfully updated"
    click_on "Back"
  end

  test "destroying a like" do
    visit likes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "like was successfully destroyed"
  end
end
