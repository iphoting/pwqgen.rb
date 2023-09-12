#!/usr/bin/env rake
require 'rubygems'
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "cucumber"
require "cucumber/rake/task"
require 'rdoc/task'

RSpec::Core::RakeTask.new do |spec|
	spec.rspec_opts = ['-f d', '--color']
end
Cucumber::Rake::Task.new(:features) do |t|
	t.cucumber_opts = ["features", "--format", "pretty"]
end
RDoc::Task.new do |r|
	r.main = "README.md"
	r.rdoc_files.include("README.md", "ChangeLog", "lib/**/*.rb")
	r.rdoc_dir = "doc"
end

task :default => :test
task :test => [:spec, :features]
task :doc => :rdoc

