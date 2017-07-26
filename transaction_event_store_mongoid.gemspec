# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'transaction_event_store_mongoid/version'

Gem::Specification.new do |spec|
  spec.name          = "transaction_event_store_mongoid"
  spec.version       = TransactionEventStoreMongoid::VERSION
  spec.authors       = ["Gareth Andrew"]
  spec.email         = ["gingerhendrix@gmail.com"]

  spec.summary       = %q{Mongoid client for transaction_event_store}
  spec.description   = %q{Mongoid client for transaction_event_store}
  spec.homepage      = "https://github.com/gingerhendrix/transaction_event_store_mongoid"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency 'mongoid', '>= 5.1'
  spec.add_dependency 'transaction_event_store', '~> 0.0.1'
  spec.add_dependency 'ruby_event_store', '~> 0.13'
  spec.add_dependency 'activesupport', '>= 3.0'
  spec.add_dependency 'activemodel', '>= 3.0'
end
