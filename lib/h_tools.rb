require 'awesome_print'

require 'h_tools/gt/rbs'

module HTools
  DOCS = 'https://github.com/phlowerteam/htools'.freeze
  class << self
    def cmdline
      return ap("Incorrect command pattern, should be 'ht <tool-name> [<arguments list>...]'. #{DOCS}") if ARGV.size < 2

      case ARGV[0]
      when 'gt-rbs'
        return ap("Incorrect command pattern, should be 'ht gt-rbs <master branch> <working-branch>'. #{DOCS}") if ARGV.size < 3
        Gt::Rbs.call(ARGV[1], ARGV[2])
      end
    end
  end
end

