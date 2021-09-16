# frozen_string_literal: true

require_relative "rails/version"
require "rails/application"

module Rails
  class Error < StandardError; end
  # Your code goes here...
  #
  def self.env
    ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "development"
  end

  def self.groups
    [:default, env]
  end

  def self.application
    Application.instance
  end

  def self.root
    application.root
  end
end
