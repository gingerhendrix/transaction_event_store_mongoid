require 'transaction_event_store_mongoid/lock'

module TransactionEventStoreMongoid
  class Locker
    attr_reader :adapter, :timeout, :retry_interval

    def initialize(timeout: 10, retry_interval: 0.1, adapter: ::TransactionEventStoreMongoid::Lock.new)
      @timeout = timeout
      @retry_interval = retry_interval
      @adapter = adapter
    end

    def with_lock(stream, &block)
      begin
        start = Time.now
        adapter.with_lock(stream, &block)
      rescue TransactionEventStore::CannotObtainLock
        if (Time.now - start) < timeout
          sleep(retry_interval)
          retry
        else
          raise
        end
      end
    end

  end
end
