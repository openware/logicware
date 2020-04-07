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


  spec.add_development_dependency "bundler",   ">= 2.1.0"
  spec.add_development_dependency "rake",      ">= 13.0.0"
  spec.add_development_dependency "rack-test", ">= 1.1.0"
  spec.add_development_dependency "rspec",     ">= 3.9.0"
  spec.add_development_dependency "rbnacl",    ">= 7.0.0"
  spec.add_development_dependency "pry-byebug"

  spec.add_runtime_dependency "activesupport", ">= 6.0.0"
  spec.add_runtime_dependency "rack",          "~> 2.2.0"
  spec.add_runtime_dependency "jwt",           "~> 2.2.0"

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
