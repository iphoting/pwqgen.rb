#!/usr/bin/env rake
require 'rubygems'
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "cucumber"
require "cucumber/rake/task"

RSpec::Core::RakeTask.new do |spec|
	spec.rspec_opts = ['-f d', '--color']
end
Cucumber::Rake::Task.new(:features) do |t|
	t.cucumber_opts = "features --format pretty"
end

task :default => :test
task :test => [:spec, :features]

