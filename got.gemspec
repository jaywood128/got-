
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "got/version"

Gem::Specification.new do |spec|
  spec.name          = "got"
  spec.version       = Got::VERSION
  spec.authors       = ["'Johnathon Wood'"]
  spec.email         = ["'jaywood128@gmail.com'"]

  spec.summary       = %q{Game of Thrones CLI gem that returns information about Westeros, a ficitonal realm created by George R.R. Martin.}
  spec.description   = %q{Scrapes and adds functionality to the Game of Thrones API.}
  spec.homepage      = "https://github.com/jaywood128/got-"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #
  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = "Westeros"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "gem-release"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "httparty"

end
