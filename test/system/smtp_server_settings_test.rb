require "application_system_test_case"

class SmtpServerSettingsTest < ApplicationSystemTestCase
  setup do
    @smtp_server_setting = smtp_server_settings(:one)
  end

  test "visiting the index" do
    visit smtp_server_settings_url
    assert_selector "h1", text: "Smtp Server Settings"
  end

  test "creating a Smtp server setting" do
    visit smtp_server_settings_url
    click_on "New Smtp Server Setting"

    click_on "Create Smtp server setting"

    assert_text "Smtp server setting was successfully created"
    click_on "Back"
  end

  test "updating a Smtp server setting" do
    visit smtp_server_settings_url
    click_on "Edit", match: :first

    click_on "Update Smtp server setting"

    assert_text "Smtp server setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Smtp server setting" do
    visit smtp_server_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Smtp server setting was successfully destroyed"
  end
end
