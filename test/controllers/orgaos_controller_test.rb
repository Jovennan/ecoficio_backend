require 'test_helper'

class OrgaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orgao = orgaos(:one)
  end

  test "should get index" do
    get orgaos_url
    assert_response :success
  end

  test "should get new" do
    get new_orgao_url
    assert_response :success
  end

  test "should create orgao" do
    assert_difference('Orgao.count') do
      post orgaos_url, params: { orgao: { chefe_id: @orgao.chefe_id, endereco: @orgao.endereco, nome: @orgao.nome } }
    end

    assert_redirected_to orgao_url(Orgao.last)
  end

  test "should show orgao" do
    get orgao_url(@orgao)
    assert_response :success
  end

  test "should get edit" do
    get edit_orgao_url(@orgao)
    assert_response :success
  end

  test "should update orgao" do
    patch orgao_url(@orgao), params: { orgao: { chefe_id: @orgao.chefe_id, endereco: @orgao.endereco, nome: @orgao.nome } }
    assert_redirected_to orgao_url(@orgao)
  end

  test "should destroy orgao" do
    assert_difference('Orgao.count', -1) do
      delete orgao_url(@orgao)
    end

    assert_redirected_to orgaos_url
  end
end
