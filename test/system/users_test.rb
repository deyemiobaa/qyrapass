require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Access expiry date", with: @user.access_expiry_date
    fill_in "Email", with: @user.email
    check "Is active" if @user.is_active
    fill_in "Last signed in", with: @user.last_signed_in
    fill_in "Name", with: @user.name
    fill_in "Phone", with: @user.phone
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Access expiry date", with: @user.access_expiry_date.to_s
    fill_in "Email", with: @user.email
    check "Is active" if @user.is_active
    fill_in "Last signed in", with: @user.last_signed_in.to_s
    fill_in "Name", with: @user.name
    fill_in "Phone", with: @user.phone
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
