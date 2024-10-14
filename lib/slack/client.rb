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
      config.token ||= ENV.fetch('SLACK_BOT_TOKEN', nil)
    end

    Slack::Web::Client.configure do |config|
      config.user_agent   = 'Slack Ruby Client/1.0'
      config.timeout      = 60
      config.open_timeout = 60
    end

    @client = Slack::Web::Client.new do |faraday|
      faraday.ssl[:ca_file] = '/home/rnardi/.rvm/gems/ruby-3.3.1@slack_bot/gems/certified-1.0.0/ca-certificates.crt'
    end
  end

  def find_user_id_by_name(username)
    user = @client.users_info(user: "@#{username}")
    user ? user.id : nil
  end

  def chat(message, channel: fetch_channel)
    @client.chat_postMessage(channel: channel,
                             text: message,
                             username: fetch_bot_name,
                             unfurl_links: false,
                             unfurl_media: false)
  rescue Slack::Web::Api::Errors::TooManyRequestsError
    sleep 60
    retry
  end

  private

  def fetch_channel
    ENV.fetch('COMM_CHANNEL', 'github_bot_test')
  end

  def fetch_bot_name
    ENV.fetch('BOT_NAME', 'Warden')
  end
end
