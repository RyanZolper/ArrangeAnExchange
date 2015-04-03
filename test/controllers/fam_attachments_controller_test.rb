require 'test_helper'

class FamAttachmentsControllerTest < ActionController::TestCase
  setup do
    @fam_attachment = fam_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fam_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fam_attachment" do
    assert_difference('FamAttachment.count') do
      post :create, fam_attachment: { family_id: @fam_attachment.family_id, image: @fam_attachment.image }
    end

    assert_redirected_to fam_attachment_path(assigns(:fam_attachment))
  end

  test "should show fam_attachment" do
    get :show, id: @fam_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fam_attachment
    assert_response :success
  end

  test "should update fam_attachment" do
    patch :update, id: @fam_attachment, fam_attachment: { family_id: @fam_attachment.family_id, image: @fam_attachment.image }
    assert_redirected_to fam_attachment_path(assigns(:fam_attachment))
  end

  test "should destroy fam_attachment" do
    assert_difference('FamAttachment.count', -1) do
      delete :destroy, id: @fam_attachment
    end

    assert_redirected_to fam_attachments_path
  end
end
