# frozen_string_literal: true
source "https://rubygems.org"
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'cocoapods'
gem 'fastlane'

# danger
gem 'danger-flutter_lint'
gem 'danger-lgtm'
gem 'danger-checkstyle_reports'


plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
