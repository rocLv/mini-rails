require "test_helper"

class ActionControllerTest < Minitest::Test
  class TestController < ActionController::Base
    before_action :callback, only: [:show]
    after_action :callback_after, only: [:show]

    def index
      response << "index"
    end

    def show
      response << "show"
    end

    private
      def callback
        response << "callback"
      end

      def callback_after
        response << "callback_after"
      end
  end

  def test_calls_index
    controller = TestController.new
    controller.response = []
    controller.process :index

    assert_equal ["index"], controller.response
  end

  def test_callbacks
    controller = TestController.new
    controller.response = []
    controller.process :show

    assert_equal ["callback", "show", "callback_after"], controller.response
  end

  class Request
    def params
      { 'id' => 1 }
    end
  end

  def test_real_controller
    controller = PostsController.new
    controller.request = Request.new
    controller.process :show
    assert_kind_of Post, controller.instance_variable_get(:@post)
  end
end