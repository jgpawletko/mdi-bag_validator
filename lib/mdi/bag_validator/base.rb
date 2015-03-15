require 'sneakers'
require 'open3'

module Mdi
  module BagValidator
    class Base
      include Sneakers::Worker
      from_queue 'bag_validation'
      opts = {   :env => 'test',
                 :durable => true,
                 :ack => true,
                 :threads => 1,
                 :prefetch => 1,
                 :timeout_job_after => 100000000,
                 :exchange => 'dummy',
                 :heartbeat_interval => 5
             }
      Sneakers.configure(opts)

      def work(msg)
        exe = ENV['BAG_EXECUTABLE'] || '/usr/local/bin/bag'
        puts "============================================================="
        puts "received #{msg}"
        o,e,s = Open3.capture3("#{exe} verifyvalid #{msg}")
        puts "#{o}"
        puts "-------------------------------------------------------------"
        puts "#{e}"
        puts "-------------------------------------------------------------"
        puts "#{s}"
        puts "============================================================="
        ack!
      end
    end
  end
end
