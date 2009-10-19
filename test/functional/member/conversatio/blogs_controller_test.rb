require File.dirname(__FILE__) + '/../../../test_helper'


class Member::Conversatio::BlogsControllerTest < ActionController::TestCase

  def setup
    @controller = Member::Conversatio::BlogsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  context "BloggershipsController in Member's area" do
    context "with a logged user" do
      setup do
        @member_user = Factory(:user, :login => 'member_user')
        @request.session[:user_id] = @member_user.id

        @blog = Factory.build(:blog, :title => 'My Blog', :description => 'Cool description')
      end

      context "on POST to :create" do
        context "with valid attributes" do
          setup do
            post :create, :blog => {:title => @blog.title, :description => @blog.description}
          end

          should_assign_to :blog
          should_respond_with :redirect
          #should_redirect_to("the blogs' path") { conversatio_blog_path(@blog) }
          should_set_the_flash_to(/created/i)
        end

        context "with invalid attributes" do
          setup do
            post :create, :blog => {:title => "", :description => ""}
          end

          should_assign_to :blog
          should_respond_with :success
          should_render_template :new
          should_set_the_flash_to(/failed/i)
        end
      end

    end

  end
end