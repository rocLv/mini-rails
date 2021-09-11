# frozen_string_literal: true

require "test_helper"

class Mini::RailsTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Mini::Rails.const_defined?(:VERSION)
    end
  end

  test "something useful" do
    assert_equal("expected", "actual")
  end
end
