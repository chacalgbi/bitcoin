require 'test_helper'

class MineracaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mineracao = mineracaos(:one)
  end

  test "should get index" do
    get mineracaos_url
    assert_response :success
  end

  test "should get new" do
    get new_mineracao_url
    assert_response :success
  end

  test "should create mineracao" do
    assert_difference('Mineracao.count') do
      post mineracaos_url, params: { mineracao: { acronimo: @mineracao.acronimo, nome: @mineracao.nome } }
    end

    assert_redirected_to mineracao_url(Mineracao.last)
  end

  test "should show mineracao" do
    get mineracao_url(@mineracao)
    assert_response :success
  end

  test "should get edit" do
    get edit_mineracao_url(@mineracao)
    assert_response :success
  end

  test "should update mineracao" do
    patch mineracao_url(@mineracao), params: { mineracao: { acronimo: @mineracao.acronimo, nome: @mineracao.nome } }
    assert_redirected_to mineracao_url(@mineracao)
  end

  test "should destroy mineracao" do
    assert_difference('Mineracao.count', -1) do
      delete mineracao_url(@mineracao)
    end

    assert_redirected_to mineracaos_url
  end
end
