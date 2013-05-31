require "graphite/monitor/version"

module Graphite
  module Monitor
    include HTTParty

    def initialize(target, period='1min', combine_by='sum')
      @target = "summarize(#{target},\"#{period}\",\"#{combine_by}\")"
    end

    def latest_body(options = {})
      resp = self.class.get('/render/', :query => {
                     :target => @target,
                     :format => 'json'
                   }.merge(options))
      resp.parsed_response if resp.ok?
    end

    def latest(options = {:from => '-30min'})
      body = latest_body(options)
      output = {}
      if body && body.size > 0
        body.each do |metric|
          name = metric['target'].match(/summarize\(([^,]+),/)[1]
          output[name] = metric['datapoints'].map {|val, t| val || 0}
        end
      else
        puts "No data for target #{@target} with #{options.inspect}"
      end
      output
    end    
  end
end
