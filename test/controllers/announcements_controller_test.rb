require 'test_helper'

class AnnouncementsControllerTest < ActionController::TestCase
  setup do
    @announcement = announcements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:announcements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create announcements" do
    assert_difference('Announcement.count') do
      post :create, announcements: { content: @announcement.content, title: @announcement.title }
    end

    assert_redirected_to announcement_path(assigns(:announcements))
  end

  test "should show announcements" do
    get :show, id: @announcement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @announcement
    assert_response :success
  end

  test "should update announcements" do
    patch :update, id: @announcement, announcements: { content: @announcement.content, title: @announcement.title }
    assert_redirected_to announcement_path(assigns(:announcements))
  end

  test "should destroy announcements" do
    assert_difference('Announcement.count', -1) do
      delete :destroy, id: @announcement
    end

    assert_redirected_to announcements_path
  end
end
