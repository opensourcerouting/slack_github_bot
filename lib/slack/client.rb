# SPDX-License-Identifier: BSD-2-Clause
#
# client.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

class Client
  def initialize
    Slack.configure do |config|
      config.token ||= ENV['SLACK_BOT_TOKEN']
    end

    Slack::Web::Client.configure do |config|
      config.user_agent   = 'Slack Ruby Client/1.0'
      config.timeout      = 60
      config.open_timeout = 60
    end

    @client = Slack::Web::Client.new
  end

  def chat(message)
    @client.chat_postMessage(channel: fetch_channel, text: message, username: fetch_bot_name)
  rescue Slack::Web::Api::Errors::TooManyRequestsError
    sleep 60
    retry
  end

  private

  def fetch_channel
    ENV.fetch('COMM_CHANNEL', 'github_bot_test')
  end

  def fetch_bot_name
    ENV.fetch('BOT_NAME', 'Trish')
  end
end
