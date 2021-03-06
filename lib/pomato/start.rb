require 'pomato/paths'
require 'pomato/options'

module Pomato
  class Start
    include Paths
    include Options

    def execute
      time = (opts[:for] || 25).to_i * 60
      name = opts.arguments.empty? ? 'pomato' : opts.arguments.join(' ')
      add_job start: now, name: name, time: time
    end

    def options
      Slop::Options.new.tap do |opts|
        opts.banner = 'usage: start [options] ...'
        opts.string '--for', 'duration (eg. 10)'
      end
    end
  end
end
