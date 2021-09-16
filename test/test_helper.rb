# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift File.expand_path("muffin_blog", __dir__)

require_relative "muffin_blog/config/environment"

require "minitest/autorun"
require "minitest/color"
