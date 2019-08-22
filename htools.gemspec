# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'h_tools/version'

Gem::Specification.new do |s|
  s.name        = 'htools'
  s.version     = HTools::VERSION
  s.licenses    = ['LGPL-3.0+']
  s.summary     = "HTools(Handy Tools) a suite of useful tools for IT-guys"
  s.authors     = ["PhlowerTeam"]
  s.email       = 'phlowerteam@gmail.com'
  s.files       = `git ls-files`.split($/)
  s.executables   = ['ht']
  s.homepage    = 'https://rubygems.org/gems/htools'
  s.metadata    = { "source_code_uri" => "https://github.com/phlowerteam/htools" }
  s.require_paths = ["lib"]

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_runtime_dependency 'awesome_print', '~> 1.1', '>= 1.1.0'
  s.add_runtime_dependency 'colorize',  '~> 0.8'
end
