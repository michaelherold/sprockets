require 'delegate'

module Sprockets
  # Internal: Used for lazy loading processors.
  #
  #   LazyProxy.new { CoffeeScriptTemplate }
  #
  class LazyProxy < Delegator
    def initialize(&block)
      @_block = block
    end

    def call(input)
      __getobj__.call(input)
    end

    def __getobj__
      @_obj ||= @_block.call
    end
  end
end
