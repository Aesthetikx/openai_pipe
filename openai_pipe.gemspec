# frozen_string_literal: true

require_relative "lib/openai_pipe/version"

Gem::Specification.new do |spec|
  spec.name = "openai_pipe"
  spec.version = OpenAIPipe::VERSION
  spec.authors = ["John DeSilva"]
  spec.email = ["desilvjo@umich.edu"]

  spec.summary = "A UNIX-ey interface to OpenAI"
  spec.description = "Provides pipe and redirect functionality to quick_openai"
  spec.homepage = "https://www.github.com/Aesthetikx/openai_pipe"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.github.com/Aesthetikx/openai_pipe"
  spec.metadata["changelog_uri"] = "https://www.github.com/Aesthetikx/openai_pipe/blob/master/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "quick_openai", "~> 0.1.3"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
