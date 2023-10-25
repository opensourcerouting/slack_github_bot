# SPDX-License-Identifier: BSD-2-Clause
#
# slack_ruby_bot_server_events.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

SlackRubyBotServer::Events.configure do |config|
  config.signing_secret ||= ENV.fetch('SLACK_SIGNING_SECRET', nil)
  config.signature_expires_in ||= 300
end
