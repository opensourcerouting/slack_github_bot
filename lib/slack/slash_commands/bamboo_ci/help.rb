# SPDX-License-Identifier: BSD-2-Clause
#
# help.rb
# Part of NetDEF CI System
#
# Copyright (c) 2023 by
# Network Device Education Foundation, Inc. ("NetDEF")
#
# frozen_string_literal: true

module Slack
  module BambooCi
    class Help
      TEXT = '
/ci notify <pr> [all | errors | pass | off]
		<pr> is the PR number (or * for the off option)
		all: All finished runs
		errors: Just failed runs
		pass: Just successful runs
		off: Disable notifications
	Notify on all CI runs (all) or just the CI runs with errors (errors) or only for
	successful CI runs (pass)
    (similar to your current "subscribe")

    Example:
    	/ci notify 6 pass
    Returns a slack notification whenever the PR6 finishes running and passes all CI tests

/ci subscribe <github_name> [all | errors | pass | off]
		github_name is the Github Username
		all: All finished runs
		errors: Just failed runs
		pass: Just successful runs
		off: Disable notifications
	Similar to notify, but for all CI runs for that specific Github User

	Example:
		/ci subscribe mwinter-osr all
	Will turn on slack notification for all CI Pull Request runs for Author mwinter-osr

/ci settings
	Returns CI settings for this specific slack user:

	Example:
		/ci settings

	Gives Output:
		Enabled notification for PR 6 when it passes
		Subscribed to status of all PRs by Github User mwinter-osr

/ci help
	(i.e this)
'

      def self.text
        TEXT
      end
    end
  end
end
