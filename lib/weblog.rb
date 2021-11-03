require "set"
require "weblog/version"
require "weblog/page"
require "weblog/parser"

module Weblog
  class Error < StandardError
    attr_reader :code

    def initialize(message, code = -1)
      super(message)
      @code = code
    end
  end

  FileNotFoundError = Class.new(Error)
end
