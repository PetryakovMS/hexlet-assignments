require "test_helper"

class NotesFlowTest < ActionDispatch::IntegrationTest
  setup do
    @bulletins = bulletins(:one)
  end

  test 'opens all bulletins page' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens one bulletin page' do
    note = Bulletin.create(title: "Title 1", body: "Description 1")

    # debugger

    get bulletin_url(note.id)
    assert_response :success
    assert_select 'h1', 'Bulletin page'
    assert_select 'h4', 'Title 1'
    assert_select 'p', 'Description 1'
  end

  test 'opens one note page with fixture' do
    get bulletin_url(@bulletins.id)
    assert_response :success
    assert_select 'h1', 'Bulletin page'
    assert_select 'h4', 'MyString1'
    assert_select 'p', 'MyText1'
  end
end