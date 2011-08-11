module Mule
  class Job
    attr_accessor :file, :workers, :name
    attr_reader :events
    
    def initialize
      @workers = 1
      @events        = {
        :before_fork => Proc.new {},
        :after_fork  => Proc.new {}
      }
    end
    
    def before_fork(&block)
      @events[:before_fork] = block if block_given?
    end
    
    def after_fork(&block)
      @events[:after_fork] = block if block_given?
    end

    def workers
      @workers.is_a?(Proc) ? @workers.call(self) : @workers
    end

  end
end