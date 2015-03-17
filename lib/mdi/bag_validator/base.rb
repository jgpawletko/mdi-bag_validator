require 'sneakers'
require 'open3'

module Mdi
  module BagValidator
    class Base
      include Sneakers::Worker
      from_queue 'bag_validation'
      opts = {   :env => 'test',
                 :amqp => ENV['AMQP_URL'] || 'amqp:://localhost',
                 :durable => true,
                 :ack => true,
                 :threads => 1,
                 :prefetch => 1,
                 :timeout_job_after => 100000000,
                 :exchange => 'rstar_direct',
                 :exchange_type => :direct,
                 :heartbeat_interval => 5
             }
      Sneakers.configure(opts)

      def work(msg)
        cmd = ENV['BAG_EXECUTABLE'] || '/usr/local/bin/bag verifyvalid'
        puts "============================================================="
        puts "received #{msg}"
        o,e,s = Open3.capture3("#{cmd} #{msg}")
        puts "STDOUT:"
        puts "#{o}"
        puts "-------------------------------------------------------------"
        puts "STDERR:"
        puts "#{e}"
        puts "-------------------------------------------------------------"
        puts "STATUS:"
        puts "#{s}"
        puts "============================================================="
        result_msg = "bag_validation of :#{msg}: " + (s == 0 ? 'passed' : 'FAILED')
        publisher.publish(result_msg, routing_key: 'rstar.bag_validator.result.foo')
        ack!
      end
      def publisher
        @publisher ||= Sneakers::Publisher.new(publisher_opts)
      end
      def publisher_opts
        { exchange: 'rstar_topic',
          exchange_type: :topic,
          routing_key:   'rstar.bag_validator.result.foo',
          durable: true,
          ack: true
        }
      end
    end
  end
end
