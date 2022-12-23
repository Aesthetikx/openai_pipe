# frozen_string_literal: true

require_relative "openai_pipe/version"

module OpenAIPipe
  class Error < StandardError; end

  def self.exe
    puts 'Hello World!'
  end
end
