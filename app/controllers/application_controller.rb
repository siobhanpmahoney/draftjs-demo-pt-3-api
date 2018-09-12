class ApplicationController < ActionController::API

  class NoteError < StandardError
    def initialize(message="Cannot save note without title or content.")
      super
    end
  end
end
