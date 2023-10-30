# SPDX-License-Identifier: BSD-2-Clause
#
# default.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

SlackRubyBotServer::Events.configure do |config|
  config.on :event do |event|
    event.logger.info "Received #{event[:type]}, #{event[:event][:type]}."
    { ok: true }
  end
end
