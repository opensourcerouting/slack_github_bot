#!/usr/bin/env bash

#
# SPDX-License-Identifier: BSD-2-Clause
#
# server.sh
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true
#

#
#  SPDX-License-Identifier: BSD-2-Clause
#
#  Startup script for CI Slack Bot

echo ">> Running server"
rackup -o 0.0.0.0 -p 4680 config.ru
