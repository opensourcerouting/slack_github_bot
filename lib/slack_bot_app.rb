# SPDX-License-Identifier: BSD-2-Clause
#
# application.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

require 'dotenv'
require 'rack/show_exceptions'
require 'rubygems'
require 'bundler'

Dotenv.load
Bundler.require

ENV['RACK_ENV'] ||= 'development'

require_relative '../config/initializers/active_record_established'
require_relative '../config/initializers/slack_ruby_bot_server'
require_relative '../config/initializers/slack_ruby_bot_server_events'

require_relative '../config/env'
