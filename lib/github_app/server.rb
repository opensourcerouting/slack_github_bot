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

  # :nocov:
  run! if __FILE__ == $PROGRAM_NAME
  # :nocov:
end
