require "application_system_test_case"

class MineracaosTest < ApplicationSystemTestCase
  setup do
    @mineracao = mineracaos(:one)
  end

  test "visiting the index" do
    visit mineracaos_url
    assert_selector "h1", text: "Mineracaos"
  end

  test "creating a Mineracao" do
    visit mineracaos_url
    click_on "New Mineracao"

    fill_in "Acronimo", with: @mineracao.acronimo
    fill_in "Nome", with: @mineracao.nome
    click_on "Create Mineracao"

    assert_text "Mineracao was successfully created"
    click_on "Back"
  end

  test "updating a Mineracao" do
    visit mineracaos_url
    click_on "Edit", match: :first

    fill_in "Acronimo", with: @mineracao.acronimo
    fill_in "Nome", with: @mineracao.nome
    click_on "Update Mineracao"

    assert_text "Mineracao was successfully updated"
    click_on "Back"
  end

  test "destroying a Mineracao" do
    visit mineracaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mineracao was successfully destroyed"
  end
end
