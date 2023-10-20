# SPDX-License-Identifier: BSD-2-Clause
#
# active_record_established.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

require 'yaml'
require 'otr-activerecord'

OTR::ActiveRecord.db_dir = 'db'
OTR::ActiveRecord.migrations_paths = ['db/migrate']
OTR::ActiveRecord.configure_from_file! 'config/postgresql.yml'

Dir['lib/models/*.rb'].each { |model| require_relative model }

OTR::ActiveRecord.establish_connection!
