module SimpleCallbacks
  def initialize(*args)
    yield self if block_given?
  end

  def success!(*args) # or maybe *args
    before_success(*args) if self.respond_to?(:before_success)
    @_success_block.call(*args) if @_success_block
    after_success(*args) if self.respond_to?(:after_success)
  end

  def failure!(*args) # or maybe *args
    before_failure(*args) if self.respond_to?(:before_failure)
    @_failure_block.call(*args) if @_failure_block
    after_failure(*args) if self.respond_to?(:after_failure)
  end

  def success(&cb)
    @_success_block = cb
  end

  def failure(&cb)
    @_failure_block = cb
  end
end
