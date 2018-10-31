# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datx_ruby/version'

Gem::Specification.new do |s|
  s.name = %q{datx_ruby}
  s.version = DatxRuby::VERSION
  s.date = %q{2018-10-23}
  s.summary = %q{A Ruby library to parse ipipnet datx file}
  s.description = %q{A Ruby library to parse ipipnet datx file}
  s.authors = ["limanxian"]
  s.email = ["limanxian_321@126.com"]
  s.files = `git ls-files`.split("\n")

  s.homepage = "https://github.com/limanxian/datx-ruby"
  s.license = "MIT"

  s.require_paths = ["lib"]
end
