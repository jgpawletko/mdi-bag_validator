require 'sneakers'

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
        puts "received #{msg}"
        ack!

      end
    end
  end
end
