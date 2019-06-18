
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "applephile/version"


Gem::Specification.new do |spec|
  spec.name          = "applephile"
  spec.version       = Applephile::VERSION
  spec.authors       = ["Ramon Chavez"]
  spec.email         = ["rachavez1974@gmail.com"]

  spec.summary       = %q{A gem for scraping craigslist for apple products.}
  spec.description   = %q{The higher the price you choose, the newer the item.}
  spec.homepage      = "https://github.com/rachavez1974/applephile"
  spec.license       = "MIT"
  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency 'nokogiri', '~> 1.10.3'
  spec.add_runtime_dependency 'require_all', '~> 2.0.0'
  spec.add_runtime_dependency 'colorize', '~> 0.8.1'
end
