require "application_system_test_case"

class DocumentosTest < ApplicationSystemTestCase
  setup do
    @documento = documentos(:one)
  end

  test "visiting the index" do
    visit documentos_url
    assert_selector "h1", text: "Documentos"
  end

  test "creating a Documento" do
    visit documentos_url
    click_on "New Documento"

    fill_in "Autor", with: @documento.autor_id
    fill_in "Brasao", with: @documento.brasao
    fill_in "Descricao", with: @documento.descricao
    fill_in "Nome", with: @documento.nome
    fill_in "Orgao", with: @documento.orgao_id
    fill_in "Titulo", with: @documento.titulo
    fill_in "Visibilidade", with: @documento.visibilidade
    click_on "Create Documento"

    assert_text "Documento was successfully created"
    click_on "Back"
  end

  test "updating a Documento" do
    visit documentos_url
    click_on "Edit", match: :first

    fill_in "Autor", with: @documento.autor_id
    fill_in "Brasao", with: @documento.brasao
    fill_in "Descricao", with: @documento.descricao
    fill_in "Nome", with: @documento.nome
    fill_in "Orgao", with: @documento.orgao_id
    fill_in "Titulo", with: @documento.titulo
    fill_in "Visibilidade", with: @documento.visibilidade
    click_on "Update Documento"

    assert_text "Documento was successfully updated"
    click_on "Back"
  end

  test "destroying a Documento" do
    visit documentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Documento was successfully destroyed"
  end
end
