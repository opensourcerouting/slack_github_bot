# SPDX-License-Identifier: BSD-2-Clause
#
# server.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

class Server < Sinatra::Base
  get '/ping' do
    halt 200, 'Pong'
  end

  get '/say' do
    Client.new.chat('Hi')

    halt 200
  end

  get '/translate/:name' do
    user_info = Client.new.find_user_id_by_name(params[:name])

    halt 404, 'User not found' unless user_info

    halt 200, user_info.profile.display_name
  end

  post '/comment' do
    halt 401, 'Invalid user / password' unless authentication
    Client.new.chat(request.body.read)

    halt 200
  end

  post '/user' do
    halt 401, 'Invalid user / password' unless authentication

    payload = JSON.parse(request.body.read)

    Client.new.chat(payload['message'], channel: payload['slack_user_id'])

    halt 200
  end

  private

  def basic_encode(username, password)
    "Basic #{["#{username}:#{password}"].pack('m0')}"
  end

  def authentication
    if basic_encode(ENV.fetch('HTTP_USER', nil), ENV.fetch('HTTP_PASS', nil)) != request.env['HTTP_AUTHORIZATION']
      return false
    end

    true
  end

  # :nocov:
  run! if __FILE__ == $PROGRAM_NAME
  # :nocov:
end
