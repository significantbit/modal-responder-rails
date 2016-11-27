# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'modal-responder-rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'modal-responder-rails'
  spec.version       = ModalResponder::Rails::VERSION
  spec.authors       = ['Guillaume Hain']
  spec.email         = ['zedtux@zedroot.org']

  spec.summary       = %q{Ease the use of modal in your Rails}
  spec.description   = %q{This gem ease the use of modal in your Rails
                          application thanks to a Responder. This code is built
                          based on Dmitriy Dudkin's article}
  spec.homepage      = 'https://github.com/Sento/modal-responder-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'responders', '~> 2.3.0'
  spec.add_dependency 'railties', '>= 3.2', '< 6.0'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
end
