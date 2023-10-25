# SPDX-License-Identifier: BSD-2-Clause
#
# command.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

require 'singleton'

module Slack
  module BambooCi
    class Command
      COMMANDS = %w[notify subscribe settings].freeze
      NOTIFY_OPTS = %w[all errors pass off].freeze

      include SlackBot::Request
      include Singleton

      def run(params, user_id)
        @params = params
        @command, @param, @opts = @params
        @user_id = user_id

        case @command
        when 'notify'
          notify
        when 'subscribe'
          subscribe
        when 'settings'
          settings
        else
          "Invalid command - #{@command}"
        end
      end

      private

      def notify
        return 'PR must be a number' if (@param.nil? or @param.empty?) or !@param.match?(/\d+/)
        return "Opts must be #{NOTIFY_OPTS.join(',')}" if (@opts.nil? or @opts.empty?) or !NOTIFY_OPTS.include? @opts

        payload =
          {
            rule: 'notify',
            target: @param.to_i,
            notification: @opts,
            slack_user_id: @user_id
          }

        request('/slack', payload)
      end

      def subscribe
        return 'GitHub name must be fill' if @param.nil? or @param.empty?
        return "Opts must be #{NOTIFY_OPTS.join(',')}" if (@opts.nil? or @opts.empty?) or !NOTIFY_OPTS.include? @opts

        payload =
          {
            rule: 'subscribe',
            target: @param,
            notification: @opts,
            slack_user_id: @user_id
          }

        request('/slack', payload)
      end

      def settings
        payload =
          {
            event: 'settings',
            slack_user_id: @user_id
          }

        request('/slack/settings', payload)
      end

      def request(url, payload)
        resp = post_request(URI("#{ENV.fetch('HTTP_URL', nil)}/#{url}"), body: payload)

        !resp.nil? and resp.code.to_i == 200 ? resp.body : 'Internal error'
      end
    end
  end
end

