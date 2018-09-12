class ApplicationController < ActionController::API

  class NoteError < StandardError
    def initialize(msg="Cannot save note without title or content.")
      super
    end
  end
end
