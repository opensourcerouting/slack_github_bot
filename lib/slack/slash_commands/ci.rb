# SPDX-License-Identifier: BSD-2-Clause
#
# subscribe.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

SlackRubyBotServer::Events.configure do |config|
  config.on :command, '/ci' do |command|
    command.logger.info "Received a subscribe with #{command['text']} from #{command['user_id']}"

    response = Slack::BambooCi::Command.instance.run(command['text'].split, command['user_id'])

    { text: response }
  end
end
