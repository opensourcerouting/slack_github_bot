# SPDX-License-Identifier: BSD-2-Clause
#
# ping.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

SlackRubyBotServer::Events.configure do |config|
  config.on :command, '/ping' do |command|
    command.logger.info 'Received a ping, responding with pong.'
    { text: 'pong' }
  end
end
