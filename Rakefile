# coding: utf-8

require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc "Run the test suite"
RSpec::Core::RakeTask.new(:rspec) do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
  t.rspec_opts = %w|--color|
end

task default: :spec