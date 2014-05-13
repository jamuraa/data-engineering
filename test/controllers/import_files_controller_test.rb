require 'test_helper'

class ImportFilesControllerTest < ActionController::TestCase
  setup do
    @import_file = import_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import_file" do
    assert_difference('ImportFile.count') do
      post :create, import_file: {  }
    end

    assert_redirected_to import_file_path(assigns(:import_file))
  end

  test "should show import_file" do
    get :show, id: @import_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @import_file
    assert_response :success
  end

  test "should update import_file" do
    patch :update, id: @import_file, import_file: {  }
    assert_redirected_to import_file_path(assigns(:import_file))
  end

  test "should destroy import_file" do
    assert_difference('ImportFile.count', -1) do
      delete :destroy, id: @import_file
    end

    assert_redirected_to import_files_path
  end
end
