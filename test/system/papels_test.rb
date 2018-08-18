require "application_system_test_case"

class PapelsTest < ApplicationSystemTestCase
  setup do
    @papel = papels(:one)
  end

  test "visiting the index" do
    visit papels_url
    assert_selector "h1", text: "Papels"
  end

  test "creating a Papel" do
    visit papels_url
    click_on "New Papel"

    fill_in "Descricao", with: @papel.descricao
    fill_in "Nome", with: @papel.nome
    click_on "Create Papel"

    assert_text "Papel was successfully created"
    click_on "Back"
  end

  test "updating a Papel" do
    visit papels_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @papel.descricao
    fill_in "Nome", with: @papel.nome
    click_on "Update Papel"

    assert_text "Papel was successfully updated"
    click_on "Back"
  end

  test "destroying a Papel" do
    visit papels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Papel was successfully destroyed"
  end
end
