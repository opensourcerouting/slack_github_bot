# frozen_string_literal: true

#  SPDX-License-Identifier: BSD-2-Clause
#
#  puma.rb
#  Part of NetDEF CI System
#
#  Copyright (c) 2023 by
#  Network Device Education Foundation, Inc. ("NetDEF")
#

require 'puma'

workers ENV.fetch('RACK_WORKERS', 10).to_i

threads_count = ENV.fetch('RACK_MAX_THREADS', 5).to_i
threads 1, threads_count
port ENV.fetch('SLACK_BOT_PORT', 5000).to_i

preload_app!

pidfile 'puma.pid'
