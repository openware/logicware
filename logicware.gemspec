require_relative 'lib/logicware/version'

Gem::Specification.new do |spec|
  spec.name          = "logicware"
  spec.version       = Logicware::VERSION
  spec.authors       = ["Openware"]
  spec.email         = ["hello@openware.com"]

  spec.summary       = %q{Openware standard ruby library.}
  spec.description   = %q{Collection of features to share between rails and ruby repositories.}
  spec.homepage      = "https://www.openware.com/"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/openware/logicware"
  spec.metadata["changelog_uri"] = "https://github.com/openware/logicware/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
