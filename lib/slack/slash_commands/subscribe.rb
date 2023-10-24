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
  config.on :command, '/subscribe' do |command|
    extend SlackBoot::Request
    command.logger.info "Received a subscribe with #{command['text']} from #{command['user_id']}"

    params = command['text'].split

    response = valid? params

    payload =
      {
        event: 'subscribe',
        pr_id: params.first.to_i,
        notification: params[1],
        slack_user_id: command['user_id']
      }

    url = "#{ENV.fetch('HTTP_URL', nil)}/slack"
    post_request(URI(url), body: payload)

    { text: response }
  end

  private

  def valid?(params)
    return invalid_command if params.empty?

    return pr_must_be_number unless params.first.match?(/\d+/)
    return notification_must_be if params.size > 1 and !['', 'error'].include? params[1].to_s.downcase

    'ok'
  end

  def invalid_command
    '/subscribe <PR_NUMBER> <NOTIFICATION>.
Values for Notification:
- Empty, only notifies when the PR has ended
- Error, notifies when the PR has ended and every Bamboo error

Example:
/subscribe 1
/subscribe 1 error'
  end
  
  def pr_must_be_number
    'PR NUMBER must be a number'
  end

  def notification_must_be
    'Notification must be blank or error'
  end
end
