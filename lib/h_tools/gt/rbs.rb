require 'colorize'

module HTools
  module Gt
    class Rbs
      class << self
        def call(parent_branch, working_branch)
          working_branch_bak = "#{working_branch}-bak"

          last_commit_cmd = "git rev-parse HEAD"

          [
            "git checkout #{working_branch}",
            "git checkout -b #{working_branch_bak}",
            "git branch -D #{working_branch}"
          ].each { |command| perform(command) }

          confirmation(last_commit_cmd)
          last_commit = `#{last_commit_cmd}`
          puts last_commit.yellow

          [
            "git checkout #{parent_branch}",
            "git pull origin #{parent_branch}",
            "git checkout -b #{working_branch}",
            "git cherry-pick #{last_commit}"
          ].each { |command| perform(command) }

          puts 'Hope all right, bye!'.blue
        end

        private

        def confirmation(command)
          puts "[Press ENTER for runnig this command or 'q' for EXIT]:"
          puts command.red
          exit if STDIN.gets.chomp == 'q'
        end

        def perform(command)
          confirmation(command)
          `#{command}`
        end
      end
    end
  end
end
