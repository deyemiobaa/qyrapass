require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "should create member" do
    visit members_url
    click_on "New member"

    fill_in "Access expiry date", with: @member.access_expiry_date
    fill_in "Email", with: @member.email
    check "Is active" if @member.is_active
    fill_in "Last signed in", with: @member.last_signed_in
    fill_in "Name", with: @member.name
    fill_in "Phone", with: @member.phone
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit member_url(@member)
    click_on "Edit this member", match: :first

    fill_in "Access expiry date", with: @member.access_expiry_date.to_s
    fill_in "Email", with: @member.email
    check "Is active" if @member.is_active
    fill_in "Last signed in", with: @member.last_signed_in.to_s
    fill_in "Name", with: @member.name
    fill_in "Phone", with: @member.phone
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit member_url(@member)
    click_on "Destroy this member", match: :first

    assert_text "User was successfully destroyed"
  end
end
