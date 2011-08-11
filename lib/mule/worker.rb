module Mule
  class Worker
    include Log

    def run(content, job, n = 0)
      log "#{job.name || 'job'}.#{n} starting"
      instance_eval(content)
    end

  end
end