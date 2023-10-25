#  SPDX-License-Identifier: BSD-2-Clause
#
#  request.rb
#  Part of NetDEF CI System
#
#  Copyright (c) 2023 by
#  Network Device Education Foundation, Inc. ("NetDEF")
#
#  frozen_string_literal: true

module SlackBot
  module Request
    def get_request(uri)
      user, passwd = fetch_user_pass
      http = create_http(uri)

      # Create Request
      req = Net::HTTP::Get.new(uri)
      # Add authorization headers
      req.basic_auth user, passwd

      # Add JSON request header
      req.add_field 'Accept', 'application/json'

      JSON.parse(http.request(req).body)
    rescue StandardError
      nil
    end

    def delete_request(uri)
      user, passwd = fetch_user_pass
      http = create_http(uri)

      # Create Request
      req = Net::HTTP::Delete.new(uri)
      # Add authorization headers
      req.basic_auth user, passwd

      # Fetch Request
      http.request(req)
    end

    def put_request(uri)
      user, passwd = fetch_user_pass
      http = create_http(uri)

      # Create Request
      req = Net::HTTP::Put.new(uri)
      # Add authorization headers
      req.basic_auth user, passwd

      req.add_field 'Content-Type', 'application/xml'
      req.add_field 'Accept', 'application/json'

      # Fetch Request
      http.request(req)
    rescue StandardError
      nil
    end

    def post_request(uri, body: nil)
      user, passwd = fetch_user_pass
      http = create_http(uri)

      # Create Request
      req = Net::HTTP::Post.new(uri)
      # Add authorization headers
      req.basic_auth user, passwd

      unless body.nil?
        # Add headers
        req.add_field 'Content-Type', 'application/xml'
        req.body = body.to_json
      end

      req.add_field 'Accept', 'application/json'

      # Fetch Request
      http.request(req)
    rescue StandardError
      nil
    end

    def create_http(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      http
    end

    def fetch_user_pass
      [ENV.fetch('HTTP_USER', nil), ENV.fetch('HTTP_PASS', nil)]
    end
  end
end
