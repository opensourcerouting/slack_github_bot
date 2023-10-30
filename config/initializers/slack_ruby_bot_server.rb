# SPDX-License-Identifier: BSD-2-Clause
#
# slack_ruby_bot_server.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

SlackRubyBotServer.configure do |config|
  config.oauth_version = :v2
  config.oauth_scope = %w[users:read channels:read groups:read chat:write commands incoming-webhook]
end
