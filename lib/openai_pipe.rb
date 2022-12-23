# frozen_string_literal: true

require_relative "openai_pipe/version"

require "quick_openai"

module OpenAIPipe
  class Error < StandardError; end

  def self.exe
    input_from_pipe = $stdin.read if $stdin.stat.pipe?

    input_from_arguments = ARGV.join(" ") if ARGV.any?

    prompt = [input_from_arguments, input_from_pipe].compact.join("\n\n")

    puts prompt.gpt3
  end
end
