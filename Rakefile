# SPDX-License-Identifier: BSD-2-Clause
#
# Rakefile
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

require 'rubygems'

require 'bundler/setup'
load 'tasks/otr-activerecord.rake'

namespace :db do
  # Some db tasks require your app code to be loaded; they'll expect to find it here
  task :environment do
    require_relative 'config/initializers/active_record_established'
  end
end
