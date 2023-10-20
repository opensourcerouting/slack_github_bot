# SPDX-License-Identifier: BSD-2-Clause
#
# Gemfile
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

source 'https://rubygems.org'

gem 'activerecord', require: 'active_record'

gem 'dotenv'

gem 'otr-activerecord'

gem 'pagy'
gem 'pagy_cursor'
gem 'pg'
gem 'puma', '5.5.2'

gem 'rack', '2.2.3.1'

gem 'rubocop', group: %i[development test]
gem 'rubocop-performance', group: %i[development test]

gem 'sinatra', '2.0.8.1'
gem 'slack-ruby-client'
gem 'slack-ruby-bot-server-events'

group :test do
  gem 'factory_bot'
  gem 'faker'
  gem 'rack-test'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'webmock', require: 'webmock/rspec'
end